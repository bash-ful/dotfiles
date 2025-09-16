zmodload zsh/zprof
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'r:|[._-./-_+]=** r:|=**' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' original false
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=1000
unsetopt autocd
bindkey -v
setopt prompt_subst

autoload -Uz vcs_info
precmd() { vcs_info }
branch_color=#74fc68
zstyle ':vcs_info:git*' formats '(%F{#74fc68}%b%f)'

username_color=#ff73d3
hostname_color=#ff6b6a
pwd_color=#f6d268
sentinel_color=#74fc68
PROMPT='${vcs_info_msg_0_}[%F{$username_color}%n%f@%F{$hostname_color}%m%f:%F{$pwd_color}%~%f]%F{$sentinel_color}$%f '

fpath=($HOME/.zshf/zsh-completions/src $fpath)
# source /home/celeste/.zshf/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# this is mainly for foot
# Called before prompt(?)
function precmd {
    # Set window title
    print -Pn "\e]0;zsh %(1j,%j job%(2j|s|); ,)%~\e\\"
}

# Called when executing a command
function preexec {
    print -Pn "\e]0;${(q)1}\e\\"
}

# For zoxide

# Commands for zoxide. Disable these using --no-cmd.
#

function z() {
    __zoxide_z "$@"
}

function zi() {
    __zoxide_zi "$@"
}

# Completions.
if [[ -o zle ]]; then
    __zoxide_result=''

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            # Show completions for local directories.
            _cd -/

        elif [[ "${words[-1]}" == '' ]]; then
            # Show completions for Space-Tab.
            # shellcheck disable=SC2086
            __zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" --interactive -- ${words[2,-1]})" || __zoxide_result=''

            # Set a result to ensure completion doesn't re-run
            compadd -Q ""

            # Bind '\e[0n' to helper function.
            \builtin bindkey '\e[0n' '__zoxide_z_complete_helper'
            # Sends query device status code, which results in a '\e[0n' being sent to console input.
            \builtin printf '\e[5n'

            # Report that the completion was successful, so that we don't fall back
            # to another completion function.
            return 0
        fi
    }

    function __zoxide_z_complete_helper() {
        if [[ -n "${__zoxide_result}" ]]; then
            # shellcheck disable=SC2034,SC2296
            BUFFER="z ${(q-)__zoxide_result}"
            __zoxide_result=''
            \builtin zle reset-prompt
            \builtin zle accept-line
        else
            \builtin zle reset-prompt
        fi
    }
    \builtin zle -N __zoxide_z_complete_helper

    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete z
fi

eval "$(zoxide init zsh)"

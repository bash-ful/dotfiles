[[ -f $HOME/.aliases ]] && source $HOME/.aliases
[[ -f $HOME/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && source $HOME/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

autoload -Uz compinit
compinit

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'r:|[._-./-_+]=** r:|=**' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' original false

HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=1000
unsetopt autocd
bindkey -v
setopt prompt_subst

autoload -Uz vcs_info
branch_color=#74fc68
zstyle ':vcs_info:git*' formats "(%F{$branch_color}%b%f)"

username_color=#ff73d3
hostname_color=#ff6b6a
pwd_color=#f6d268
sentinel_color=#74fc68
PROMPT='${vcs_info_msg_0_}[%F{$username_color}%n%f@%F{$hostname_color}%m%f:%F{$pwd_color}%~%f]%F{$sentinel_color}$%f '

# this is mainly for foot
# Called before prompt(?)
function precmd {
    # Set window title
	 vcs_info
    print -Pn "\e]0;zsh %(1j,%j job%(2j|s|); ,)%~\e\\"
}

# Called when executing a command
function preexec {
    print -Pn "\e]0;${(q)1}\e\\"
}

eval "$(zoxide init zsh)"

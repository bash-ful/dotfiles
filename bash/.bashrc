#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return 
[[ -f $HOME/.aliases ]] && source $HOME/.aliases
#PS1='[\[\033[1m\]\[\033[38;5;251m\]\u\[\033[0m\]@\[\033[1m\]\[\033[38;5;124m\]\h\[\033[0m\]: \[\033[1m\]\[\033[037m\]\w\[\033[0m\]]\$ '
colorBold='\[\033[01m\]'
colorUsername='\[\033[38;5;206m\]'
colorReset='\[\033[00m\]'
colorHost='\[\033[38;5;219;1m\]'
colorCWD='\[\033[38;5;255;01m\]'
colorSeparator='\[\033[38;5;156m\]'

PS1="${colorBold}[${colorUsername}\u${colorReset}@${colorHost}\h${colorBold}: ${colorCWD}\w]${colorSeparator}\$ ${colorReset}"

# this is for foot and its shell integration
osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd

. "$HOME/.cargo/env"

add_to_path() {
	dir="$1"
	if [ -d "$dir" ]; then
		case ":$PATH:" in
		*:"$dir":*) ;;
		*) PATH="$PATH:$dir" ;;
		esac
	fi
}

add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.cargo/bin"
add_to_path "$HOME/.dotnet/tools"
export PATH

[ -f "$HOME/.env.private" ] && . "$HOME/.env.private"

export SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
# export MANPAGER="nvim +Man\!"
SUDO_PROMPT="[$(tput setaf 1)$(tput bold)sudo$(tput sgr0)] password for $(tput setaf 5)$(tput bold)$(whoami)$(tput sgr0):"
export SUDO_PROMPT

EDITOR=$(command -v nvim)
export EDITOR

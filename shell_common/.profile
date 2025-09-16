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

source_env() {
	if [ -f "$1" ]; then
		. "$1"
	fi
}

source_env "$HOME/.cargo/env"
source_env "$HOME/.private_env"

export SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

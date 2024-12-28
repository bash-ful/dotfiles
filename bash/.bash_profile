#
# ~/.bash_profile
#

if [ -d "/home/celeste/.local/bin" ] ; then
    PATH="$PATH:/home/celeste/.local/bin"
fi

restore-sound
# pactl set-card-profile alsa_card.pci-0000_07_00.6 pro-audio
[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

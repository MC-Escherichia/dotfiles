export $(systemctl --user show-environment | sed -e '/PATH/d')
gpg-agent --daemon
[[ -z $DISPLAY && $XDG_VTR -eq 1]] && exec startx

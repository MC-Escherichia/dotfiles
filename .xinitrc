if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load .Xresources

urxvtd -q -f -o

# map capslock to control
xmodmap -e "clear lock"
xmodmap -e "clear control"
xmodmap -e "add control = Control_L Control_R Caps_Lock"

# and here... we... go...
exec sbcl --load /home/matt/bin/startstump

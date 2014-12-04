#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
export PATH=~/.cabal/bin:~/.xmonad/bin:$PATH
export EDITOR='emacsclient'
export ALTERNATE_EDITOR=''
export BROWSER='conkeror'
export VISUAL=emedit
emacs --daemon &
syndaemon -t -k -i 2 &
xsetroot -cursor_name left_ptr
xrdb -load ~/.Xresources
xbindkeys

exec xmonad

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
export VISUAL='emacsclient'


# User configuration

export PATH=$HOME/scripts:$HOME/.gem/ruby/2.1.0/bin:$HOME/.cabal/bin:$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id:~/.ssh/frege2"

export XDG_CONFIG_HOME="~/.config"
export XDG_CACHE_HOME="~/.config/xdg_cache"

emacs --daemon &
syndaemon -t -k -i 2 &
xsetroot -cursor_name left_ptr
xrdb -load ~/.Xresources
xbindkeys

exec xmonad

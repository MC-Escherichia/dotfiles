# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="intheloop"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Ignore duplicate lines in history
setopt HIST_IGNORE_DUPS

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux common-aliases extract fasd git lein npm)

#
NPM_PACKAGES=${HOME}/.npm
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# User configuration
export PATH=$NPM_PACKAGES/bin:/usr/local/bin:$PATH
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -e $DISPLAY ]]; then
   export EDITOR='emacsclient -c'
 else
   export EDITOR='emacsclient -t'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# Development flag
export MFC_DEV="1"
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id:~/.ssh/mike_rsa:~/.ssh/mike2_rsa"
#export SSH_KEY_PATH="~/.ssh/mike_rsa"
#ssh-add $SSH_KEY_PATH
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
function e() {
    emacsclient -c $* &
    }
#alias e='emacsclient -c'
alias zshconfig="e ~/.zshrc"
alias ohmyzsh="e ~/.oh-my-zsh"
alias stumpwmrc="e ~/.stumpwmrc"

# for android compilation
export USE_CCACHE=1

# syntax hilighting on command line
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# sometimes Matt needs a lot of help
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

# file manager keybinds
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey 'OA'      cdParentKey
bindkey 'OD'      cdUndoKey


topShow() { htop <$TTY; zle redisplay; }
zle -N topShow
bindkey '^[t' topShow

alsamixerShow() { alsamixer <$TTY; zle redisplay; }
zle -N alsamixerShow
bindkey '^[a' alsamixerShow

bindkey '^[0A' history-beginning-search-backward
bindkey '^[0B' history-beginning-search-forward


export TERM=xterm-256color

GPG_TTY=$(tty)
export GPG_TTY

export BROWSER=conkeror

alias scu='systemctl --user'
alias sc='systemctl'
alias sr3='sr -browser=w3m'

export GOPATH=/usr/local/share/go
export PATH="$GOPATH/bin:$PATH"

function src(){
    source ~/.zshrc
    }

function scr(){
    #compdef _scr
    . ~/.screenlayout/$1.sh
    }

function _scr(){

    for f in ~/.screenlayout/; do
        filename= $(basename $f)
        compadd ${filename%.*}
        unset f filename
        done
}



function za(){
    zathura $* &
    }


function reset_ssh(){
    pkill ssh-agent
    unset SSH_AGENT_PID SSH_AUTH_SOCK
    export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
    #SSH_KEY_PATH=~/.ssh/{*}_rsa
    #ssh-add $SSH_KEY_PATH
    }

reset_ssh

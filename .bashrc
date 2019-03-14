# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# do not use swapfiles to avoid stalling if a network filesystem is unresponsive
alias vim='vim -n'
alias ssh='ssh -X'
alias ll='ls -l'

# yellow-red centos ps1
export PS1='[\[\033[01;033m\]\u@\h \[\033[01;031m\]\W\[\033[00m\]]\$ '
export EDITOR=vim
export TERM=xterm-256color

# system-specific initialization
if [[ $(uname -a) =~ "Linux" ]]; then
    # linux
    eval `dircolors`
    alias ls='ls --color=auto'
    export PATH=$PATH:~/.local/bin:~/bin
elif [[ $(uname -a) =~ "Darwin" ]]; then
    # mac
    alias md5sum=md5
    alias sha256sum='shasum -a 256'
    alias lsblk='diskutil list'
    export CLICOLOR=1
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
    
    # use openssl for compiles otherwise compiles involving openssl-specific stuff will fail
    export LDFLAGS="-L/usr/local/opt/openssl/lib:$LDFLAGS"
    export CFLAGS="-I/usr/local/opt/openssl/include:$CFLAGS"
    export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
else
    # screams internally
    alias ls='gls --color=auto'
    alias vi='vim'
    alias wget='wget --no-check-certificate'
    export PS1='[\u@\h \W]\$ '
fi

# for tilix vte compatibility
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# load system-specific aliases
if [[ -r ~/.bash_site ]]; then
    source ~/.bash_site
fi


# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ssh='ssh -X'

# yellow-red centos ps1
export PS1='[\[\033[01;033m\]\u@\h \[\033[01;031m\]\W\[\033[00m\]]$ '

# system-specific initialization
export TERM=xterm-256color
if [ $(uname -a | grep -c "Linux") == 1 ]; then
	eval `dircolors`
else
	# screams internally
	alias ls='gls --color=auto'
	alias ll='ls -l'
	alias vi='vim'
	alias wget='wget --no-check-certificate'
	export EDITOR=vim
	export PS1='[\u@\h \W]\$ '
fi

# for tilix vte compatibility
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# use rice R console if available
if [ -x "$(command -v rice)" ]; then
	alias R='rice'
fi

# load system-specific aliases
if [[ -r ~/.bash_site ]]; then
    source ~/.bash_site
fi


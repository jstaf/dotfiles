# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# do not use swapfiles to avoid stalling if a network filesystem is unresponsive
alias vim='vim -n'
alias ssh='ssh -X'
alias ll='ls -l'
alias b64='base64 --decode; echo'

# useful aliases/functions for ecr
alias ecr-login='$(aws ecr get-login --no-include-email)'
alias ecr-ls-repos='aws ecr describe-repositories | jq -r .repositories[].repositoryUri'

ecr-ls-images() {
    aws ecr list-images --repository "$1" --filter=tagStatus=TAGGED | jq -r .imageIds[].imageTag
}

# bash prompt/appearance customization
ps1_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# yellow-red centos ps1
export PS1='[\[\033[01;033m\]\u@\h \[\033[01;031m\]\W\[\033[00m\]$(ps1_git_branch)]\$ '
export EDITOR=vim
export TERM=xterm-256color
export PATH=$PATH:~/go/bin
export GO111MODULE=auto

# system-specific initialization
if [[ $(uname -a) =~ "Linux" ]]; then
    # linux
    eval `dircolors`
    alias ls='ls --color=auto'
    export PATH=$PATH:~/.local/bin:~/bin
    export ELECTRON_TRASH=gio  # atom bug
elif [[ $(uname -a) =~ "Darwin" ]]; then
    # mac
    export CLICOLOR=1
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
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


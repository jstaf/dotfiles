# .bashrc

# bash prompt/appearance customization

# Helper func to display the current git branch
ps1_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# shell-specific initialization
if [ -n "$ZSH_VERSION" ]; then
    setopt PROMPT_SUBST
    export PS1='[%B%F{yellow}%n@%m%f %F{red}%1~%f%b$(ps1_git_branch)]%# '
    autoload -Uz compinit
    compinit -i
elif [ -n "$BASH_VERSION" ]; then
    # Source global definitions
    if [ -f /etc/bashrc ]; then
        source /etc/bashrc
    fi
    export PS1='[\[\033[01;033m\]\u@\h \[\033[01;031m\]\W\[\033[00m\]$(ps1_git_branch)]\$ '
else
    # probably sh
    export PS1='[\u@\h \W]\$ '
fi
export EDITOR=vim
export TERM=xterm-256color
alias ll='ls -l'
alias b64='base64 --decode; echo'

# Display a csv file nicely
csv() {
    if [ ! -z "$1" ]; then
        cat $1 | column -t -s, | less -S -N
    else
        echo "Usage: csv <filename.csv>"
    fi
}

# Login to AWS ECR
alias ecr-login='aws ecr get-login-password | docker login --username AWS --password-stdin $(aws sts get-caller-identity | jq -r .Account).dkr.ecr.$(python -c "import boto3; print(boto3.Session().region_name)").amazonaws.com'
# ls available ECR repos on the CLI
alias ecr-ls-repos='aws ecr describe-repositories | jq -r .repositories[].repositoryUri'

# Show images on ECR
# usage: ecr-ls-images repo [number_of_images_to_list]
ecr-ls-images() {
    REPO=$(echo "$1" | sed 's/.\+.amazonaws.com\///g')
    MAX_ITEMS="$2"
    if [ -z "$MAX_ITEMS" ]; then
        MAX_ITEMS=10
    fi
    aws ecr describe-images --repository "$REPO" --filter=tagStatus=TAGGED \
        --query "reverse(sort_by(imageDetails,& imagePushedAt))[:"$MAX_ITEMS"]" \
        | jq 'map(del(.registryId, .imageDigest, .repositoryName, .imageSizeInBytes) | .imagePushedAt |= strflocaltime("%Y-%m-%dT%H:%M"))'
}

# Tag an image on ECR without pulling it.
# usage: ecr-tag-image repo:tag new_tag
ecr-tag-image() {
    REPO=$(echo "$1" | sed 's/.\+.amazonaws.com\///g' | sed 's/:.\+//g')
    TAG=$(echo "$1" | sed 's/.\+://g')
    MANIFEST=$(aws ecr batch-get-image --repository-name=$REPO --image-ids=imageTag=$TAG --query 'images[].imageManifest' --output text)
    aws ecr put-image --repository-name=$REPO --image-tag=$2 --image-manifest "$MANIFEST"
}

# Decrypt an AWS KMS encrypted secret
# usage: kms-decrypt ciphertext
kms-decrypt() {
    aws kms decrypt --ciphertext-blob fileb://<(echo -n "$1" | base64 -d) --query Plaintext --output text | base64 -d; echo
}

# Encrypt a string via Ansible Vault
# usage: av-encrypt string-to-encrypt
av-encrypt() {
    echo -n "$1" | ansible-vault encrypt_string
}

alias bw-unlock='export BW_SESSION=$(bw unlock --raw)'

# golang
export PATH=$PATH:~/go/bin
export GO111MODULE=auto

# nodejs
NPM_PACKAGES=~/.npm-packages
export PATH=$PATH:$NPM_PACKAGES/bin
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# ansible
export ANSIBLE_NOCOWS=True
export ANSIBLE_COW_SELECTION=random
export ANSIBLE_STDOUT_CALLBACK=unixy
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_RETRY_FILES_ENABLED=False
export ANSIBLE_PIPELINING=True
export ANSIBLE_TRANSFORM_INVALID_GROUP_CHARS=ignore

# vagrant
export VAGRANT_DISABLE_STRICT_DEPENDENCY_ENFORCEMENT=1

# system-specific initialization
if [[ $(uname -a) =~ "Linux" ]]; then
    # linux
    eval `dircolors`
    alias ls='ls --color=auto'
    export PATH=$PATH:~/.local/bin:~/bin
    if [[ $(uname -a) =~ "Ubuntu" ]]; then
        # why are you like this ubuntu
        source /usr/share/bash-completion/bash_completion
        [ -f /usr/bin/kubectl ] && source <(kubectl completion bash)
    fi
elif [[ $(uname -a) =~ "Darwin" ]]; then
    # mac
    export CLICOLOR=1
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
    export PATH="~/bin:~/homebrew/bin:$PATH"
    export GREP_OPTIONS='--color=auto'
    alias sha256sum='shasum -a 256'
    alias md5sum=md5
    if [ -f ~/bin/kubectl ]; then
        source <(kubectl completion zsh)
    fi
else
    # screams internally
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
    alias ls='ls --color'
    alias vi='vim'
fi

# for tilix vte compatibility
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    if [ -f /etc/profile.d/vte.sh ]; then
        # fedora/centos
        source /etc/profile.d/vte.sh
    else
        # ubuntu derivatives
        source /etc/profile.d/vte-2.91.sh
    fi
fi

# load system-specific aliases
if [[ -r ~/.bash_site ]]; then
    source ~/.bash_site
fi


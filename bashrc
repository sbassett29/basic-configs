# If running interactively, then:
if [ "$PS1" ]; then

    # prompt
    export PS1='\[\033[1;32m\]\h\[\033[33m\]:\[\033[1;34m\]\w\[\033[1;30m\]>\[\033[0m\] '

fi

# enable color support of ls and also add handy aliases

# some more ls aliases
alias composer="php composer.phar"


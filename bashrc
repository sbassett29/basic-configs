#if running interactively, then:
if [ "$PS1" ]; then
    build_prompt() {
        if [ $? = 0 ]; then
            stat='\033[01;32m( ^◡^)'; 
        else
            stat='\033[01;31m(⩾﹏⩽)'; 
        fi  
        comp_name=$(scutil --get ComputerName | sed 's/[^A-Z]//g') # macos
        #comp_name=$(hostname) # debian etc
        mypwd=$(dirs +0)
        git_br=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        if [[ -n "$git_br" ]]; then
            git_br=" [$git_br]"
        fi  

        echo -en "\033[1;32m"
        echo -en "$comp_name"
        echo -en "\033[1;93m:"
        echo -en "\033[1;34m"
        echo -en "$mypwd"
        echo -en "\033[1;90m"
        echo -en "$git_br"
        echo -en " $stat"
        echo -en "\033[1;90m"
        echo -en "\033[0m "
    }   
    export PS1="\$(build_prompt)"
fi

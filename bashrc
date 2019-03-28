if [ "$PS1" ]; then

	PS1=
	PROMPT_COMMAND=build_prompt

	build_prompt() {
		# track last exit here
		local status="$?"

		# computer name
		comp_name=$(scutil --get ComputerName | sed 's/[^A-Z]//g') # macos
		#comp_name=$(hostname) # debian etc

		# working directory
		mypwdlen=30
		mypwd=$(dirs +0)
		if [ ${#mypwd} -gt $mypwdlen ]; then
			mypwd="...${mypwd:(-${mypwdlen})}"
		fi

		# git branch status
		git_br=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
		if [[ -n "$git_br" ]]; then
			git_br=" [$git_br]"
		fi  

		# term colors
		B_GREEN="\[\033[01;32m\]"
		B_RED="\[\033[01;31m\]"
		B_YELLOW="\[\033[1;93m\]"
		B_BLUE="\[\033[1;34m\]"
		B_GREY="\[\033[1;90m\]"
		NORMAL="\[\033[0m\]"

        # face exist status
		if [ $status = 0 ]; then
			face=" ${B_GREEN}( ^◡^)";
		else
			face=" ${B_RED}(⩾﹏⩽)";
		fi

		# set PS1
		PS1="${B_GREEN}${comp_name}${B_YELLOW}:${B_BLUE}${mypwd}${B_GREY}${git_br}${face}> ${NORMAL}"
	}
fi

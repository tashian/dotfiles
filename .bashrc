# .bash_profile — one-time bash config. reads profile and bashrc.
# .profile — one-time stuff on shell startup. ENV vars and PATHs.
# .bashrc — anything needed by subshells or non-login shells. Personal aliases & functions.
# /etc/profile — System wide env variables and startup programs.
# /etc/bashrc — System wide aliases and functions.

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
fi

print_code() {
    enscript -1rG --line-numbers -p - --highlight=javascript --color=1 -c $1 > $2
}

alias grep='GREP_COLOR="1;33" LANG=C grep --color=auto' #use GREP_COLOR=7 to highlight whitespace


# Dotfiles, stored via https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Prevent resource forks from being tarred
alias tar='COPYFILE_DISABLE=true tar' 

# bright prompt with $HOST:$PWD
# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"
PS1="$SI\w$NM"'$(__git_ps1 " %s")'"$ $IN"

# python 3.7
# see https://docs.python.org/3/tutorial/venv.html
source ~/.pyenv/3.8.5/bin/activate

#I hate noise
set bell-style visible

if [[ $platform == 'osx' ]]; then
  export EDITOR="vi"
  alias vi="vim"
  alias ls='ls -G'
fi

# NPM
# allow locally installed npm binaries to be executed;
# added by `npm i -g add-local-binaries-to-path`
# Load npm
if [ -d /usr/local/share/npm/bin ] ; then
  export PATH=/usr/local/share/npm/bin:$PATH
fi

# direnv
if type direnv >/dev/null 2>/dev/null; then
    eval "$(direnv hook bash)"
fi

# This adds git tab completion and other stuff...
if [ -d $(brew --prefix)/etc/bash_completion.d ]; then
    for f in $(brew --prefix)/etc/bash_completion.d/*; do
        source $f
    done
fi
# 
# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/bin/google-cloud-sdk/path.bash.inc ]; then
  source "$HOME/bin/google-cloud-sdk/path.bash.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME/bin/google-cloud-sdk/completion.bash.inc ]; then
  source "$HOME/bin/google-cloud-sdk/completion.bash.inc"
fi

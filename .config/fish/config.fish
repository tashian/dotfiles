alias grep='grep --color=auto'

# Dotfiles, stored via https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

function print_code
     enscript -1rG --line-numbers -p - --highlight=javascript --color=1 -c $argv[1] > $argv[2]
end


# Prevent resource forks from being tarred
alias tar='env COPYFILE_DISABLE=true tar'

# python 3.7
# see https://docs.python.org/3/tutorial/venv.html
source ~/.pyenv/py37/bin/activate.fish

set -U EDITOR vim
alias vi='vim'
alias ls='ls -G'

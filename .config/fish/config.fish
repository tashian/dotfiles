set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

alias grep='grep --color=auto'

# Dotfiles, stored via https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

function print_code
     enscript -1rG --line-numbers -p - --highlight=javascript --color=1 -c $argv[1] > $argv[2]
end

# Prevent resource forks from being tarred
alias tar='env COPYFILE_DISABLE=true tar'

# python 3.8.5
# see https://docs.python.org/3/tutorial/venv.html
. ~/.pyenv/3.9.0/bin/activate.fish
#. $HOME/virtualenv/.tox/embed/bin/activate.fish

set -U EDITOR vim
alias vi='vim'

. ~/.config/fish/lscolors.fish
alias ls='gls --color=auto -F'

set -g fish_user_paths $HOME"/bin" $fish_user_paths

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME'/Applications/google-cloud-sdk/path.fish.inc' ]; . $HOME'/Applications/google-cloud-sdk/path.fish.inc'; end

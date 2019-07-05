# dotfiles

Install using a bare git repo:

````
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
echo "dotfiles" >> .gitignore
git clone --bare https://github.com/tashian/dotfiles.git $HOME/dotfiles
config checkout
````

More details [here](https://www.atlassian.com/git/tutorials/dotfiles)

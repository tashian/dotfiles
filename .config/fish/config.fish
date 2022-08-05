if status is-interactive
    # Commands to run in interactive sessions can go here
	alias grep='grep --color=auto'

	# Dotfiles, stored via https://www.atlassian.com/git/tutorials/dotfiles
	alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/carl/google-cloud-sdk/path.fish.inc' ]; . '/Users/carl/google-cloud-sdk/path.fish.inc'; end


# we don't use the fish_add_path command here because 
# it won't prepend to $PATH if we do.
set -g fish_user_paths $HOME"/bin" $fish_user_paths

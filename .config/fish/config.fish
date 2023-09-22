if status is-interactive
    # Commands to run in interactive sessions can go here
	alias grep='grep --color=auto'

	# Dotfiles, stored via https://www.atlassian.com/git/tutorials/dotfiles
	alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/carl/google-cloud-sdk/path.fish.inc' ]; . '/Users/carl/google-cloud-sdk/path.fish.inc'; end

# Paths will not be added if they don't exist.
fish_add_path --global --prepend $HOME"/bin" $HOME"/.cargo/bin" "/opt/homebrew/bin" "/opt/homebrew/sbin" $HOME"/.local/bin"

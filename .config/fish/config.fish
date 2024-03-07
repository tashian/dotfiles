if status is-interactive
    # Commands to run in interactive sessions can go here
	alias grep='grep --color=auto'

	# Dotfiles, stored via https://www.atlassian.com/git/tutorials/dotfiles
	alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/carl/google-cloud-sdk/path.fish.inc' ]; . '/Users/carl/google-cloud-sdk/path.fish.inc'; end

# Paths will not be added if they don't exist.
# we don't use the fish_add_path command here because 
# it won't prepend to $PATH if we do.
fish_add_path --global --prepend $HOME"/bin" $HOME"/go/bin" $HOME"/.cargo/bin" "/opt/homebrew/bin" "/opt/homebrew/sbin" $HOME"/.local/bin"

# pnpm
set -gx PNPM_HOME "/Users/carl/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

source /Users/carl/.docker/init-fish.sh || true # Added by Docker Desktop

source /opt/homebrew/opt/asdf/libexec/asdf.fish || true

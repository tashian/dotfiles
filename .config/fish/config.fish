if status is-interactive
    # Commands to run in interactive sessions can go here
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/carl/google-cloud-sdk/path.fish.inc' ]; . '/Users/carl/google-cloud-sdk/path.fish.inc'; end

# we don't use the fish_add_path command here because 
# it won't prepend to $PATH if we do.
set -g fish_user_paths $HOME"/bin" $HOME"/go/bin" "/opt/homebrew/sbin" $fish_user_paths

# pnpm
set -gx PNPM_HOME "/Users/carl/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
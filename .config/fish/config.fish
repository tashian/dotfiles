if status is-interactive
    # Commands to run in interactive sessions can go here
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/carl/google-cloud-sdk/path.fish.inc' ]; . '/Users/carl/google-cloud-sdk/path.fish.inc'; end

# we don't use the fish_add_path command here because 
# it won't prepend to $PATH if we do.
set -g fish_user_paths $HOME"/bin" $fish_user_paths

echo "hi"

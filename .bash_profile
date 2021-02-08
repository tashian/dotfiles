# .bash_profile — only reads profile and bashrc
# .profile — one-time stuff on shell startup. ENV vars and PATHs.
# .bashrc — anything needed by subshells or non-login shells. Bash aliases & functions.
# /etc/profile — System wide env variables and startup programs.
# /etc/bashrc — System wide aliases and functions.

. ~/.profile
if [ -f "$HOME/.bashrc" ] ; then
  . ~/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

# .bash_profile — only reads profile and bashrc
# .profile — one-time stuff on shell startup. ENV vars and PATHs.
# .bashrc — anything needed by subshells or non-login shells. Bash aliases & functions.
# /etc/profile — System wide env variables and startup programs.
# /etc/bashrc — System wide aliases and functions.

export LESS="-R#3m~gQ"
export EDITOR="vi"

# npm
export PATH="$PATH:./node_modules/.bin"

# homebrew
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

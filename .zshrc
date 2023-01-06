# If you come from bash you might have to change your $PATH
export PATH=$HOME/bin:/opt/homebrew/sbin:/opt/homebrew/bin:~/.cargo/bin:/usr/local/bin:$PATH
export CPATH=/opt/homebrew/include
export C_INCLUDE_PATH=$CPATH
export CPLUS_INCLUDE_PATH=$CPATH
export LIBRARY_PATH=/opt/homebrew/lib

# Export GPG TTY
export GPG_TTY=$(tty)

if [ "$TMUX" = "" ]; then tmux; fi

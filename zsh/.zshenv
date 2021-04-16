## Environment Variables and Settings
# This file contains anything that needs to be loaded anytime a new shell is created and whenever a script with the #!/bin/zsh shebang is ran

## XDG Config 

export XDG_CACHE_HOME=${XDG_CACHE_HOME:=~/.cache}
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local"

## Vim 
# export VIMDIRPATH="$XDG_CONFIG_HOME/vim"
# export VIMINIT='let $MYVIMRC="$VIMDIRPATH/vimrc" | source $MYVIMRC'

# ASDF
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/.asdfrc"
# export ASDF_DATA_DIR="$XDG_DATA_HOME/.asdf"
# export asdf_dir="$ASDF_DATA_DIR"

# add custom functions location to front of fpath
fpath=( $ZDOTDIR/zfunc "${fpath[@]}" )

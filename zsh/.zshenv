## Environment Variables and Settings
# This file contains anything that needs to be loaded anytime a new shell is created and whenever a script with the #!/bin/zsh shebang is ran

## XDG Config 

export XDG_CACHE_HOME=${XDG_CACHE_HOME:=~/.cache}
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local"

## Zinit
typeset -A ZINIT
# ZINIT_HOME=$XDG_CACHE_HOME/zsh/zsinit
ZINIT[HOME_DIR]=$XDG_DATA_HOME/zinit

## Vim 
export VIMDIRPATH="$XDG_CONFIG_HOME/vim"
export VIMINIT='let $MYVIMRC="$VIMDIRPATH/vimrc" | source $MYVIMRC'

# ASDF
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/.asdfrc"
export ASDF_DATA_DIR="$XDG_DATA_HOME/.asdf"
# export asdf_dir="$ASDF_DATA_DIR"

# add custom functions location to front of fpath
fpath=( $ZDOTDIR/zfunc "${fpath[@]}" )


## Misc
export TRANSMISSION_HOME="$XDG_CONFIG_HOME/transmission"

# Poetry

## Gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nic khamm/.local/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nickhamm/.local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nickhamm/.local/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nickhamm/.local/google-cloud-sdk/completion.zsh.inc'; fi

## TimeWarrior & TaskWarrior
export TIMEWARRIORDB="$XDG_DAT_HOME/.timewarrior"


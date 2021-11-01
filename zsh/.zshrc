# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


typeset -U path
setopt autocd
# Enable vi mode
bindkey -v

# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 

### Zim Install & Source
autoload -Uz installZim asdfSetup
installZim


# source ${ZIM_HOME}/login_init.zsh -q &!
### - ZINIT IS DEPECRATED (https://www.reddit.com/r/zsh/comments/qinb6j/httpsgithubcomzdharma_has_suddenly_disappeared_i/)
### Zinit Instll & Source
#autoload -Uz installZinit asdfSetup
#installZinit
#source "$XDG_DATA_HOME/zinit/bin/zinit.zsh"

#zinit light zinit-zsh/z-a-patch-dl
#zinit light zinit-zsh/z-a-bin-gem-node


### Install starship as prompt
## zinit ice as"command" from"gh-r" atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
## zinit light starship/starship

### Install spaceship as prompt
## zinit light denysdovhan/spaceship-prompt

### Install Powerline10k as prompt
#zinit ice depth=1
#zinit light romkatv/powerlevel10k
### Install Tmux
#zinit ice as"program" from"gh-r" ver"latest" mv"tmux* -> tmux" atclone"cd tmux; ./configure --prefix=$ZPFX;make && make install" pick"$ZPFX/bin/tmux"
#zinit load tmux/tmux

### Install Vim
#zinit ice as"program" atclone"rm -f src/auto/config.cache; \
#    ./configure  --with-features=huge --enable-rubyinterp=yes --enable-python3interp=yes --enable-luainterp=yes --enable-cscope --enable-perlinterp=yes --enable-gettext --prefix=$ZPFX" atpull"%atclone" \
#    make"all install" pick"$ZPFX/bin/vim"
#zinit load vim/vim

### Install Direnv
#zinit from"gh-r" as"program" mv"direnv* -> direnv" \
#        atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
#            pick"$ZPFX/bin/direnv" src="zhook.zsh" for \
#                    direnv/direnv
### Install asdf
#zinit id-as'asdf' \
#    atinit'export ASDF_DATA_DIR="$XDG_DATA_HOME/.asdf";' \
#    src"asdf.sh" \
#    atload"asdfSetup" \
#    for @asdf-vm/asdf
#zinit cdclear -q

## Install Poetry
## zinit ice as"program" atclone"python install-poetry.py" pick"/Users/nickhamm/.local/bin/poetry" nocompletions
#zinit ice as"program" \
#    atclone"python install-poetry.py; $XDG_DATA_HOME/bin/poetry completions zsh > $ZINIT[COMPLETIONS_DIR]/_poetry" \
#    atpull"%atclone" pick"$XDG_DATA_HOME/bin/poetry" nocompletions
#zinit load python-poetry/poetry

### Install Anaconda/Miniconda
#CURRENT_ANACONDA=Anaconda3-2021.05-MacOSX-x86_64.sh
#CURRENT_MINICONDA=Miniconda3-latest-MacOSX-x86_64.sh
#CONDA_DIR=$XDG_DATA_HOME/conda
## anaconda -- needs tweaked
## zinit as"command" id-as"anaconda" dl"https://repo.anaconda.com/archive/$CURRENT_CONDA" sbin"$CONDA_DIR/bin/conda" atclone'rm -rf $CONDA_DIR; sh $CURRENT_CONDA -b -p $CONDA_DIR' atpull"%atclone" for zdharma/null
## miniconda
##
#zinit as"command" id-as"miniconda"  \
#    dl"https://repo.anaconda.com/miniconda/$CURRENT_MINICONDA" \
#    sbin"$CONDA_DIR/bin/conda" \
#    atclone"rm -rf $CONDA_DIR; sh $CURRENT_MINICONDA -b -p $CONDA_DIR" \
#    atpull"%atclone" nocompletions \
#for zdharma/null

#zinit load esc/conda-zsh-completion

## Install mdloader for flashing keyboard
## download mdloader_mac
## download applet-mdflash.bin
## chmod u+x mdloader_mac
##

### Install Google Cloud SDK
## zinit snippet


#autoload -Uz compinit
#compinit
#zinit cdreplay -q
#kitty + complete setup zsh | source /dev/stdin
## source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
## zinit wait"1" lucid from"gh-r" as"null" for \
##      sbin"**/fd"        @sharkdp/fd \
##      sbin"exa* -> exa"  ogham/exa

## To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


typeset -U path
setopt autocd
# Enable vi mode
bindkey -v

# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 

## Zinit Instll & Source
autoload -Uz installZinit asdfSetup
installZinit
source "$XDG_DATA_HOME/zinit/bin/zinit.zsh"

zinit light zinit-zsh/z-a-patch-dl
zinit light zinit-zsh/z-a-bin-gem-node


## Install starship as prompt
zinit ice as"command" from"gh-r" atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
zinit light starship/starship

## Install spaceship as prompt
# zinit light denysdovhan/spaceship-prompt

## Install Tmux
zinit ice as"program" from"gh-r" ver"latest" mv"tmux* -> tmux" atclone"cd tmux; ./configure --prefix=$ZPFX;make && make install" pick"$ZPFX/bin/tmux"
zinit load tmux/tmux

## Install Vim
zinit ice as"program" atclone"rm -f src/auto/config.cache; \
    ./configure  --with-features=huge --enable-rubyinterp=yes --enable-python3interp=yes --enable-luainterp=yes --enable-cscope --enable-perlinterp=yes --enable-gettext --prefix=$ZPFX" atpull"%atclone" \
    make"all install" pick"$ZPFX/bin/vim"
zinit load vim/vim

## Install Direnv
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
        atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
            pick"$ZPFX/bin/direnv" src="zhook.zsh" for \
                    direnv/direnv
## Install asdf
zinit id-as'asdf' \
    atinit'export ASDF_DATA_DIR="$XDG_DATA_HOME/.asdf";' \
    src"asdf.sh" \
    atload"asdfSetup" \
    for @asdf-vm/asdf
zinit cdclear

# Install Poetry
# zinit ice as"program" atclone"python install-poetry.py" pick"/Users/nickhamm/.local/bin/poetry" nocompletions
zinit ice as"program" \
    atclone"python install-poetry.py; $XDG_DATA_HOME/bin/poetry completions zsh > $ZINIT[COMPLETIONS_DIR]/_poetry" \
    atpull"%atclone" pick"$XDG_DATA_HOME/bin/poetry" nocompletions
zinit load python-poetry/poetry

## Install Anaconda/Miniconda
CURRENT_ANACONDA=Anaconda3-2021.05-MacOSX-x86_64.sh
CURRENT_MINICONDA=Miniconda3-latest-MacOSX-x86_64.sh
CONDA_DIR=$XDG_DATA_HOME/conda
# anaconda -- needs tweaked
# zinit as"command" id-as"anaconda" dl"https://repo.anaconda.com/archive/$CURRENT_CONDA" sbin"$CONDA_DIR/bin/conda" atclone'rm -rf $CONDA_DIR; sh $CURRENT_CONDA -b -p $CONDA_DIR' atpull"%atclone" for zdharma/null
# miniconda
#
zinit as"command" id-as"miniconda"  \
    dl"https://repo.anaconda.com/miniconda/$CURRENT_MINICONDA" \
    sbin"$CONDA_DIR/bin/conda" \
    atclone"rm -rf $CONDA_DIR; sh $CURRENT_MINICONDA -b -p $CONDA_DIR" \
    atpull"%atclone" nocompletions \
for zdharma/null

zinit load esc/conda-zsh-completion
## Install Google Cloud SDK
# zinit snippet

# zinit cdclear 

autoload -Uz compinit
compinit
zinit cdreplay

# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# zinit wait"1" lucid from"gh-r" as"null" for \
#      sbin"**/fd"        @sharkdp/fd \
#      sbin"exa* -> exa"  ogham/exa

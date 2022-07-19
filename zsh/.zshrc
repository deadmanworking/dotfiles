typeset -U path
setopt autocd
# Enable vi mode
bindkey -v

# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 

## Zinit Instll & Source
autoload -Uz installZinit
installZinit
source "${ZINIT_HOME}/zinit.zsh"

# Set variable for determining correct binary
case "$OSTYPE" in
  linux*) bpick='*((#s)|/)*(linux|musl)*((#e)|/)*' ;;
  darwin*) bpick='*(macos|darwin)*' ;;
  *) echo 'WARN: unsupported system -- some cli programs might not work' ;;
esac

## Zinit plugins
# Per docs this should be first - enables some extra functionality (like sbin ice)
zinit light-mode for zdharma-continuum/zinit-annex-bin-gem-node

## Theme/Prompt
# Load powerlevel10k 
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# Load pure 
# zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
# zinit light sindresorhus/pure

# Load starship
# zi for \
#     from'gh-r' \
#     sbin'**/starship -> starship' \
#   starship/starship

## Load spaceship
# zinit light denysdovhan/spaceship-prompt

## Utilities 
# Bat - better cat
zi for \
    from'gh-r' \
    sbin'**/bat -> bat' \
  @sharkdp/bat \

# exa - better cd
zi for \
    from'gh-r' \
    sbin'**/exa-> exa' \
  ogham/exa \
    # sbin'diff-so-fancy' \
  # so-fancy/diff-so-fancy
zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit load zdharma-continuum/zsh-diff-so-fancy



# diff-so-fancy -- fancy git diffs

# brew -- NOT CONFIRMED AS GOOD FOR ME TO USE WITH M1 
# zi for \
#     as'null' \
#     atclone'%atpull' \
#     atpull'
#          ./bin/brew update --preinstall \
#       && ln -sf $PWD/completions/zsh/_brew $ZINIT[COMPLETIONS_DIR] \
#       && rm -f brew.zsh \
#       && ./bin/brew shellenv --dummy-arg > brew.zsh \
#       && zcompile brew.zsh' \
#     depth'3' \
#     nocompletions \
#     sbin'bin/brew' \
#     src'brew.zsh' \
#   homebrew/brew

# ## Install TmuX
# zi for \
#     alias'tmux=$ZPFX/tmux' \
#     from'gh-r' \
#     mv'tmux* -> tmux' \
#     pick'tmux' \
#   @tmux/tmux
# zinit ice as"program" from"gh-r" ver"latest" mv"tmux* -> tmux" atclone"cd tmux; ./configure --prefix=$ZPFX;make && make install" pick"$ZPFX/bin/tmux"
# zinit load tmux/tmux

## Install Vim
# zinit ice as"program" atclone"rm -f src/auto/config.cache; \
#     ./configure  --with-features=huge --enable-rubyinterp=yes --enable-python3interp=yes --enable-luainterp=yes --enable-cscope --enable-perlinterp=yes --enable-gettext --prefix=$ZPFX" atpull"%atclone" \
#     make"all install" pick"$ZPFX/bin/vim"
# zinit load vim/vim

## Install Direnv
# zinit from"gh-r" as"program" mv"direnv* -> direnv" \
#         atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
#             pick"$ZPFX/bin/direnv" src="zhook.zsh" for \
#                     direnv/direnv
## Install asdf
# zinit id-as'asdf' \
#     atinit'export ASDF_DATA_DIR="$XDG_DATA_HOME/.asdf";' \
#     src"asdf.sh" \
#     atload"asdfSetup" \
#     for @asdf-vm/asdf
# zinit cdclear -q

# Install Poetry
# zinit ice as"program" atclone"python install-poetry.py" pick"/Users/nickhamm/.local/bin/poetry" nocompletions
# zinit ice as"program" \
#     atclone"python install-poetry.py; $XDG_DATA_HOME/bin/poetry completions zsh > $ZINIT[COMPLETIONS_DIR]/_poetry" \
#     atpull"%atclone" pick"$XDG_DATA_HOME/bin/poetry" nocompletions
# zinit load python-poetry/poetry

## Install Anaconda/Miniconda
# CURRENT_ANACONDA=Anaconda3-2021.05-MacOSX-x86_64.sh
# CURRENT_MINICONDA=Miniconda3-latest-MacOSX-x86_64.sh
# CONDA_DIR=$XDG_DATA_HOME/conda
# anaconda -- needs tweaked
# zinit as"command" id-as"anaconda" dl"https://repo.anaconda.com/archive/$CURRENT_CONDA" sbin"$CONDA_DIR/bin/conda" atclone'rm -rf $CONDA_DIR; sh $CURRENT_CONDA -b -p $CONDA_DIR' atpull"%atclone" for zdharma/null
# miniconda
#
# zinit as"command" id-as"miniconda"  \
#     dl"https://repo.anaconda.com/miniconda/$CURRENT_MINICONDA" \
#     sbin"$CONDA_DIR/bin/conda" \
    # atclone"rm -rf $CONDA_DIR; sh $CURRENT_MINICONDA -b -p $CONDA_DIR" \
    # atpull"%atclone" nocompletions \
# for zdharma/null

# zinit load esc/conda-zsh-completion
## Install Google Cloud SDK

## Completions

autoload -Uz compinit
compinit
# kitty + complete setup zsh | source /dev/stdin
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# zinit wait"1" lucid from"gh-r" as"null" for \
#      sbin"**/fd"        @sharkdp/fd \
#      sbin"exa* -> exa"  ogham/exa

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

export PATH="$HOME/.poetry/bin:$PATH"

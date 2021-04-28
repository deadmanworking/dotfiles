
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
source "$ZINIT_HOME/bin/zinit.zsh"
autoload -Uz compinit && compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## Install starship as prompt
zinit ice as"command" from"gh-r" atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
zinit light starship/starship

## Install Tmux
# zinit ice as"program" from"gh-r" ver"latest" mv"tmux* -> tmux" atclone"cd tmux; ./configure --prefix=$ZPXF; make && make install" pick"$ZPFX/bin/tmux"
zinit ice as"program" from"gh-r" ver"latest" mv"tmux* -> tmux" atclone"cd tmux; ./configure --prefix=$ZPFX;make && make install" pick"$ZPFX/bin/tmux"
zinit load tmux/tmux

## Install Vim
zinit ice as"program" atclone"rm -f src/auto/config.cache; \
    ./configure  --with-features=huge --enable-rubyinterp=yes --enable-python3interp=yes --enable-luainterp=yes --enable-cscope --enable-perlinterp=yes --enable-gettext --prefix=$ZPFX" atpull"%atclone" \
    make"all install" pick"$ZPFX/bin/vim"
zinit load vim/vim


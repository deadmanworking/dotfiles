
## Homebrew
# Initialize Homebrew

eval "$(/opt/homebrew/bin/brew shellenv)"

# Completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

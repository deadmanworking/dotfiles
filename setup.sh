#!/usr/bin/env bash
#
# Setup Script for dotfiles

# 

set -eou pipefail 
# -e = if command fails immediately exit
# -o pipefail = causes a pipeline (like curl) to fail if any command errors
# -u = treats unset variables as an error and immediately exit

### How is this supposed to work?
## Interactive 
# - Checks the OS and/or processor (m1 or no?)
# - Says hi (TODO: How can we find the user's first name everytime?)
# - 2 choices: Select what is installed or just install it all
# - if the latter, confirm with a list
# - Script should create .zshrc (et al)
## Non-interactive
# 1. Clone Repo
# 2. Create ~/.zshenv
# 3. source ~/.zshenv
# 4. Install Homebrew
# 5. Do homebrew things





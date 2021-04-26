#!/bin/bash

cd ~ && mkdir app
cd app
wget -c https://github.com/sdy-xu/bioinformatics/blob/master/Linux/sub.zip
unzip sub.zip
echo "# duf
alias duf='$HOME/app/duf/duf'

# ag
alias ag='$HOME/app/ag/bin/ag'

# axel
alias axel='$HOME/app/axel/bin/axel'

# exa
alias exa='$HOME/app/exa/bin/exa'

# bat
alias bat='$HOME/app/bat/bat'

# alias
alias ls='exa'
alias ll='exa -lh'
alias la='exa -la'"

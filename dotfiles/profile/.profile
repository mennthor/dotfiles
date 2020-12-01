# Fix El Capitan UTF8 encoding. Check via `locale
# export LANG="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

# CLI Prefix: User:Path(blue)$ (blue: \[\e[34m\], reset: \[\e[0m\])
export PS1="\u:\[\e[34m\]\W\[\e[0m\]\\$ "
# Editor
export EDITOR="vim"

# Bash completion from homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# homebrew coreutils:
# Commands also provided by macOS have been installed with the prefix "g".
# If you need to use these commands with their normal names, you
# can add a "gnubin" directory to your PATH from your bashrc like:
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

##############################################################################
#### Environment variables
# Add system Python user packages in ~/Library/Python/2.7 to PATH
# export PATH=${HOME}/Library/Python/2.7/bin:${PATH}

# Java
if [ /usr/libexec/java_home -F 2> /dev/null ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Init pyenv python version manager: https://github.com/pyenv/pyenv#installation
export PYENV_ROOT=${HOME}/.pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
    export PYENV_VIRTUALENV_DISABLE_PROMPT=0  # Still show venv in PS1
fi


##############################################################################
#### Load local extras
if [ -f ${HOME}/.profile_local ]; then
  source ${HOME}/.profile_local
fi

##############################################################################
#### Alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="ls -GFh"
alias la="ls -A"
alias ll="ls -Hl"
alias lla="la -Hl"
alias cpwd="pwd | pbcopy"
alias notebook="jupyter-notebook"
alias brewup="brew update && brew upgrade && brew cask upgrade && brew cask cleanup"
alias gdiff="git diff --no-index"
# Use vim as a pager. Note: Maybe not a very robust way to guess the path...
# See also: https://ubuntu-tutorials.com/2008/07/14/use-vim-as-a-syntax-highlighting-pager/
alias vless=$(find /usr/share/vim -type d -regex ".*vim[0-9][0-9]" | tail -n 1)"/macros/less.sh"
# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"


##############################################################################
#### Load functions
if [ -f ${HOME}/.profile_functions ]; then
  source ${HOME}/.profile_functions
fi

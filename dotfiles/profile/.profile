# Fix El Capitan UTF8 encoding. Check via `locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# CLI Prefix: User:Path(blue)$
export PS1="\u:\[\e[34m\]\W\[\e[0m\]\$ "
# Editor
export EDITOR="nvim"

# Bash completion from homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


##############################################################################
#### Environment variables
# Add system Python user packages in ~/Library/Python/2.7 to PATH
export PATH=${HOME}/Library/Python/2.7/bin:${PATH}

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Init pyenv python version manager
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi


##############################################################################
#### Load local extras
source ${HOME}/.profile_local


##############################################################################
#### Alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="ls -GFAh"
alias lso="\ls -GFh"
alias vp="vimpager"
alias cpp="pwd | pbcopy"
alias notebook="jupyter-notebook"
alias bing="${HOME}/Google\ Drive/osx/scripts/Bing_Wallpapers/bing_wallpaper.sh"
alias daily="bing && brew update && brew upgrade"

# Make interactive ssh tunnel. $1 = host from .ssh/config, $2 = port
function tunnel {
    if [ -z "$2" ]; then
        echo "Need port number as 2nd argument. Exiting."; return 1 2>/dev/null;
    fi
    ssh -t -L $2:localhost:$2 $1
}

# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"

# Mount remote filesystem via sshfs function
function mntsshfs {
    if [ -z "$1" ]; then
        echo "Need ssh host from config as argument. Exiting."; return 1 2>/dev/null;
    fi
    sshfs "$1":/ ${HOME}/sshfs/"$1" -o volname="$1",auto_cache,reconnect,defer_permissions,noappledouble
}

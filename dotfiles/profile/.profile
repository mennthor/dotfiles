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
# System Python with packages in ~/Library/Python/2.7: preferred Python path
export PATH=${HOME}/Library/Python/2.7/bin:${PATH}

# Homebrew Python 3: Activate on demand (virtualenv style)
function activate_python3 {
    # Function to deactivate
    function deactivate {
        # Restore original state
        if [ ! -z "$_OLD_PATH" ]; then
            export PATH=${_OLD_PATH}
            export PS1=${_OLD_PS1}
            unset _OLD_PATH
            unset _OLD_PS1
            unalias notebook3
            # Also remove this function from the scope
            unset -f deactivate
        fi
        }
    # If we are already running an active py3 environment
    deactivate
    # Save old env vars
    _OLD_PATH=${PATH}
    _OLD_PS1=${PS1}
    # Set new path on top of all
    export PATH=${HOME}/Library/Python/3.6/bin:${PATH}
    # Indicate that we are in a python3 environment
    export PS1="(BrewPy3) $PS1"
    # Set notebook3 alias
    alias notebook3="jupyter3-notebook"
}

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Ruby gem user install directory
    # export PATH=$PATH:${HOME}/.gem/ruby/2.0.0/bin

# ROOT, TRUEE
function useROOT6 {
    export ROOTSYS=${HOME}/bin/root6/v6.06.08/build
    source $ROOTSYS/bin/thisroot.sh
    echo "~~ Activated ROOT6 environment ~~"
    echo "     Version $(root-config --version) with Python $(root-config --python-version) in"
    echo "       $(root-config --bindir)"
}

# IceCube
    # Create some useful paths
    # export ICPATH=${HOME}/icecube
    # export ICSOFTWARE=${ICPATH}/software
    # export ICSVN=http://code.icecube.wisc.edu/svn
    # export ICREC=$ICSOFTWARE/icerec/parasitic
    # alias icerec="source ${ICREC}/build/activate.sh"
    # Add private script folders to PYTHONPATH
    # export PYTHONPATH=$PYTHONPATH:$ICPATH/scripts
    # Add path to json file managing the data file paths
    # export ICDATAPATH=$ICPATH/data/ICDataPaths.json

# Init pyenv python version manager
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi


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
# Exit ranger to current dir
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'

# Make interactive ssh tunnel. $1 = host from .ssh/config, $2 = port
function tunnel {
    ssh -t -L $2:localhost:$2 $1
}

# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"

# screen
alias scls="screen -ls"

# Mount phido, e5login, cobalt, macmini. x = proxy mount
alias mntphido="sshfs phido1:/ ${HOME}/sshfs/phido -o volname=phido,auto_cache,reconnect,defer_permissions,noappledouble"
alias mntphido="sshfs phido1:/ ${HOME}/sshfs/phido -o volname=phido,auto_cache,reconnect,defer_permissions,noappledouble"
alias mnte5login="sshfs e5login:/ ${HOME}/sshfs/e5login -o volname=e5login,auto_cache,reconnect,defer_permissions,noappledouble"
alias mnticcobalt="sshfs iccobalt:/ ${HOME}/sshfs/iccobalt -o volname=iccobalt,auto_cache,reconnect,defer_permissions,noappledouble"
alias mntphidox="sshfs phido1x:/ ${HOME}/sshfs/phido -o volname=phido,auto_cache,reconnect,defer_permissions,noappledouble"
alias mnte5loginx="sshfs e5login:/ ${HOME}/sshfs/e5login -o volname=e5login,auto_cache,reconnect,defer_permissions,noappledouble"
alias mntmacminix="sshfs macmini:/ ${HOME}/sshfs/macmini -o volname=macmini,auto_cache,reconnect,defer_permissions,noappledouble"

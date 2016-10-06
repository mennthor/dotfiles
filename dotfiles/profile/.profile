# Fix El Capitan UTF8 encoding. Check via `locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# CLI Prefix: User:Path(blue)$
export PS1="\u:\[\e[34m\]\W\[\e[0m\]\$ "
# Editor
export EDITOR="vim"

# Bash completion from homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


##############################################################################
#### Environment variables
# Make user packages from OSX and homebrew Python available
    export PATH=${HOME}/Library/Python/3.5/bin:${PATH}
    export PATH=${HOME}/Library/Python/2.7/bin:${PATH}
    # export PYTHONSTARTUP=${HOME}/.ipython/profile_default/startup/00-basic_imports.py
# Anaconda python 3. Only enable on demand
    function activate_py3 {
        export OLD_PATH=$PATH
        export PATH=${HOME}/anaconda3/bin:${PATH}

        function deactivate {
            if [ ! -z "$OLD_PATH" ]; then
                export PATH=$OLD_PATH
                unset OLD_PATH
                unset -f deactivate
            fi
            }
        }
# Java
    export JAVA_HOME=$(/usr/libexec/java_home)
# Ruby gem user install directory
    # export PATH=$PATH:${HOME}/.gem/ruby/2.0.0/bin
# ROOT, TRUEE
    # export ROOTSYS=${HOME}/bin/root/5.34.34/build
    # source $ROOTSYS/bin/thisroot.sh
    # export PATH=${PATH}:${HOME}/bin/TRUEE/4.0/build/bin
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


##############################################################################
#### Alias
alias ls="ls -GFAh"
alias cpp="pwd | pbcopy"
alias notebook="jupyter-notebook"
alias notebook3="jupyter3-notebook"
alias bing="${HOME}/Google\ Drive/osx/scripts/Bing_Wallpapers/bing_wallpaper.sh"
alias daily="bing && brew update && brew upgrade"

# git
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"

# screen
alias scls="screen -ls"
alias scs="screen -S"
alias scx="screen -x"

# Mount phido, e5login, cobalt, macmini. x = proxy mount
alias mntphido="sshfs phido1:/ ${HOME}/sshfs/phido -o volname=phido,auto_cache,reconnect,defer_permissions,noappledouble"
alias mntphido="sshfs phido1:/ ${HOME}/sshfs/phido -o volname=phido,auto_cache,reconnect,defer_permissions,noappledouble"
alias mnte5login="sshfs e5login:/ ${HOME}/sshfs/e5login -o volname=e5login,auto_cache,reconnect,defer_permissions,noappledouble"
alias mnticcobalt="sshfs iccobalt:/ ${HOME}/sshfs/iccobalt -o volname=iccobalt,auto_cache,reconnect,defer_permissions,noappledouble"
alias mntphidox="sshfs phido1x:/ ${HOME}/sshfs/phido -o volname=phido,auto_cache,reconnect,defer_permissions,noappledouble"
alias mnte5loginx="sshfs e5login:/ ${HOME}/sshfs/e5login -o volname=e5login,auto_cache,reconnect,defer_permissions,noappledouble"
alias mntmacminix="sshfs macmini:/ ${HOME}/sshfs/macmini -o volname=macmini,auto_cache,reconnect,defer_permissions,noappledouble"

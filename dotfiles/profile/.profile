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
alias ls="ls -GFAh"
alias lso="\ls -GFh"
alias vp="vimpager"
alias cpwd="pwd | pbcopy"
alias notebook="jupyter-notebook"
alias bing="${HOME}/Google\ Drive/osx/scripts/Bing_Wallpapers/bing_wallpaper.sh"
alias brewup="brew update && brew upgrade && brew cask upgrade && brew cask cleanup"
alias daily="bing && brewup"
alias gdiff="git diff --no-index"
# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"


function subldiff {
HELP="Usage:
  subldiff <LEFT_FILE> <RIGHT_FILE>

Uses subldiff plugin to diff two files in a Sublime Text view.
"
  for i in "$@"
  do
    case $i in
      -h|--help)
        echo "$HELP"
        return 0
        ;;
    esac
  done

  if [ "$#" -ne 2 ]; then  # $# = Number of args
    echo "Need 2 parameters: <LEFT_FILE> <RIGHT_FILE>"
    echo ""
    echo "$HELP"
    return 0
  fi

  # From: https://www.sublimerge.com/sm3/docs/vcs-integration.html
  echo "Comparing file $1 on the left and $2 on the right."
  subl -n --wait "$1" "$2" --command 'sublimerge_diff_views'
}


function tunnel {
HELP="Usage:
  tunnel [-p=<port>, 2222] <ssh_host>

Open an interactive ssh tunnel to <ssh_host> on <port>.
"
  PORT=""
  for i in "$@"
  do
    case $i in
      -h|--help)
        echo "$HELP"
        return 0
        ;;
      -p=*)
        PORT="${i#*=}"  # '#': Pattern substitution
        shift
        ;;
    esac
  done

  if [ -z $1 ]; then
    echo "Error: <ssh_host> must be specified as the last non-opt argument!"
    echo ""
    echo "$HELP"
    return 0
  fi

  HOST="$1"
  PORT=${PORT:-2222}  # :- Default if par is ""

  echo "Options:"
  echo "  Host : $HOST"
  echo "  Port : $PORT"

  ssh -t -L $PORT:localhost:$PORT "$HOST"
}


function mntsshfs {
HELP="Usage:
  mntsshfs [-d=<remote_dir>, ~] [-m=<mount_point>, <ssh_host>] <ssh_host>

Mounts a remote file system path <remote_dir> to local <mount_point> via sshfs.
"
  # Parsing: stackoverflow.com/questions/192249
  REM_DIR=""
  MNT_DIR=""
  for i in "$@"
  do
    case $i in
      -h|--help)
        echo "$HELP"
        return 0
        ;;
      -d=*)
        REM_DIR="${i#*=}"
        shift  # Shift index to next arg in $@
        ;;
      -m=*)
        MNT_DIR="${i#*=}"
        shift
        ;;
    esac
  done

  if [ -z $1 ]; then
    echo "Error: <ssh_host> must be specified as the last non-opt argument!"
    echo ""
    echo "$HELP"
    return 0
  fi
  HOST="$1"

  # Setup local mount dir
  MNT_DIR="${MNT_DIR:-"$HOME/sshfs/$HOST"}"
  if [ -d "$MNT_DIR" ]; then
    read -p "$MNT_DIR already exists, still continue (yes/no)? " CHOICE
    case "$CHOICE" in
      yes)
        ;;
      no)
        echo "Exiting."
        return 1;
        ;;
      *)
        echo "Type (yes|no). Exiting."
        return 1;
        ;;
    esac
  fi
  mkdir -p "$MNT_DIR"

  # Get remote home path for default param
  REM_HOME=$(ssh "$HOST" 'echo $HOME' 2>/dev/null)
  REM_DIR="${REM_DIR:-"$REM_HOME"}"

  VOLNAME=$(basename "$MNT_DIR")
  sshfs "$HOST":"$REM_DIR" "$MNT_DIR" \
    -o volname="$VOLNAME",auto_cache,reconnect,defer_permissions,noappledouble

  echo "Mount options:"
  echo "  Remote dir : $REM_DIR"
  echo "  Mount dir  : $MNT_DIR"
  echo "  Host       : $HOST"
  echo "  Volname    : $VOLNAME"
}

# CLI Prefix: User:Path(blue)$ (blue: \[\e[34m\], reset: \[\e[0m\])
export PS1="\u@\h:\[\e[31m\]\W\[\e[0m\]\\$ "
# Editor
export EDITOR="vim"

##############################################################################
#### Source collection of extra cmds, adapt bashrc_local to your needs
if [ -f $HOME/.bashrc_system ]; then
    source $HOME/.bashrc_system
fi

if [ -f $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi

# Init pyenv python version manager: https://github.com/pyenv/pyenv#installation
export PYENV_ROOT=${HOME}/.pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
export PATH=${PYENV_ROOT}/shims:${PATH}
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
    export PYENV_VIRTUALENV_DISABLE_PROMPT=0  # Still show venv in PS1
fi

##############################################################################
#### From http://qq.is/tutorial/2011/11/17/ssh-keys-through-screen.html
# It puts the ssh auth socket file always in the same spot, so whenever
# reattachiing after re-ssh'ing into the cluster, the new auth socket is
# created at the same location and tmux can continue to operate.
# In .tmux.conf, add `set -g update-environment "SSH_AUTH_SOCK"` to bring the
# env var over to all new panes after a reattachment.
# You can manually do: tmux setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK in a session.
# If this does not work, re-add the ssh key: ssh-add ~/.ssh/keyname on the
# connecting machine and reconnect.
_TMUX_SSH_AUTH_SOCK="/work/thorben.menne/.ssh/ssh-agent-$HOSTNAME-tmux"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $_TMUX_SSH_AUTH_SOCK ]
then
	# We have SSH_AUTH_SOCK set but not pointing to our custom location.
	# Remove our old link
    rm -f $_TMUX_SSH_AUTH_SOCK
	# Relink to current ssh auth socket
    ln -sf $SSH_AUTH_SOCK $_TMUX_SSH_AUTH_SOCK
    # And set SSH_AUTH_SOCK to point there
	export SSH_AUTH_SOCK=$_TMUX_SSH_AUTH_SOCK
fi

##############################################################################
#### Alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="ls -Fh --color=auto"
alias ll="ls -Hl"
alias la="ls -A"
alias lla="ll -A"
alias gdiff="git diff --no-index"
# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"


# CLI Prefix: User:Path(blue)$ (blue: \[\e[34m\], reset: \[\e[0m\])
export PS1="\u@\h:\[\e[34m\]\W\[\e[0m\]\\$ "
# Editor
export EDITOR="vim"

##############################################################################
#### Source collection of extra cmds, adapt bashrc_local to your needs
if [ -f $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi

##############################################################################
#### From http://qq.is/tutorial/2011/11/17/ssh-keys-through-screen.html
# It puts the ssh auth socket file always in the same spot, so whenever
# reattachiing after re-ssh'ing into the cluster, the new auth socket is
# created at the same location and tmux can continue to operate.
# In .tmux.conf, add `set -g update-environment "SSH_AUTH_SOCK"` to bring the
# env var over to all new panes after a reattachment.
_TMUX_SSH_AUTH_SOCK="/work/thorben.menne/.ssh/ssh-agent-$USER-tmux"
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
alias la="ls -A"
alias ll="ls -Hl"
alias lla="la -Hl"
alias gdiff="git diff --no-index"
# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"


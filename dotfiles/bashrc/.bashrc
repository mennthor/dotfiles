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
# You can manually do: tmux setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK in a session
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
alias grep="grep --color=auto"
alias ls="ls -Fh --color=auto"
alias ll="ls -Hl"
alias la="ls -A"
alias lla="ll -A"
alias lla="la -Hl"
alias htopu="htop -u thorben.menne"
alias gdiff="git diff --no-index"
# Max C++ std (stackoverflow.com/questions/46980383)
alias cppstd="g++ -x c++ -E -dM -< /dev/null | grep __cplusplus"
# Use vim as a pager https://ubuntu-tutorials.com/2008/07/14/use-vim-as-a-syntax-highlighting-pager/
alias vless=$(find /usr/share/vim -type d -regex ".*vim[0-9][0-9]" | tail -n 1)"/macros/less.sh"
# From https://coderwall.com/p/grmruq/git-status-on-all-repos-in-folder
alias gitsall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias gitpall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git pull && echo)' \;"
# Get random 4 byte number from /dev/urandom
alias getrnd4="od -An -N 4 -tu4 /dev/urandom"


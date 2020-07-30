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


# bash_profile for OSX turning off the 'zsh is now the default shell' print
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f $HOME/.profile ]; then
	source $HOME/.profile
fi

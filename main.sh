#!/bin/sh

echo "Starting setup script. Continue (yes/no)?"
while True; do
	read answer
	if [ "$answer" == "yes" ]; then
		echo "Starting setup now."; break;
	elif [ "$answer" == "no" ]; then
		echo "Exiting."; exit;
	else
		echo "Please enter yes or no."
	fi
done


echo "-----------------------------------------------------------------------"
echo ":: Installing xcode command line tools ::"
xcode-select --install


echo "-----------------------------------------------------------------------"
echo ":: Installing homebrew ::"
if test ! $(which brew); then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "  Running brew update ..."
brew update

echo "  Install brews via brew bundle from Brewfile ..."
brew tap homebrew/bundle
brew bundle --file=./homebrew/Brewfile

echo "  Cleaning up brew binaries and cache to free disk space ..."
brew cask cleanup
rm -rf $(brew --cache)


echo "-----------------------------------------------------------------------"
echo ":: Linking Dropbox and Google Drive to home folder ::"
if [ ! -d "${HOME}/Dropbox" ]; then
	echo "No Dropbox folder found in home. Linking /Volumes/nifty/Dropbox."
	ln -s /Volumes/nifty/Dropbox ${HOME}
fi
if [ ! -d "${HOME}/Google Drive" ]; then
	echo "No Google Drive folder found in home. Linking /Volumes/nifty/Google\ Drive."
	ln -s /Volumes/nifty/Google\ Drive ${HOME}
fi


echo "-----------------------------------------------------------------------"
echo ":: Stowing dotfiles to home folder ::"
for d in `ls ./dotfiles`; do
	stow --dir=dotfiles --target=${HOME} -v $d
done  # Unstow with -vD option
echo"Local .profile get's unstowed and copied instead"
	rm ${HOME}.profile_local
	cp "./dotfiles/profile/.profile_local" ${HOME}


echo "-----------------------------------------------------------------------"
echo ":: Stowing sublime text 3 settings to packages folder ::"
TARGET="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "$TARGET"
stow --target="$TARGET" -v sublimetext3
echo "Manually cloning LaTeX-cwl files to ST3 packages folder"
git clone https://github.com/LaTeXing/LaTeX-cwl.git "$TARGET"/LaTeX-cwl


echo "-----------------------------------------------------------------------"
echo ":: Setting up tmux ::"
# Note: https://github.com/arcticicestudio/nord-terminal-app is needed and a
# powerline font to look good (Hack from brew)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source .tmux.conf


echo "-----------------------------------------------------------------------"
echo ":: Setting up neovim ::"
echo "  Unstow nvim to prevent symlinking the whole plugged folder"
stow --dir=dotfiles --target=${HOME} -vD nvim
echo "  Install vim plug"
curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "  Restow to install plugs from init.vim"
stow --dir=dotfiles --target=${HOME} -v nvim
echo "  Install plugs from init.vim via Vim-Plug"
nvim -c PlugInstall -c qall


echo "-----------------------------------------------------------------------"
echo ":: Setting up OSX python ::"
chmod 744 ./osx/python.sh
./osx/python.sh


echo "-----------------------------------------------------------------------"
echo ":: Setting up homebrews python3 ::"
chmod 744 ./homebrew/python3.sh
./homebrew/python3.sh


echo "-----------------------------------------------------------------------"
echo ":: Update and setup MacTex ::"
echo "  Use new /etc/paths.d/TeX paths without starting a new terminal ..."
eval `/usr/libexec/path_helper -s`

echo "  Set some MacTe X settings ..."
sudo tlmgr option autobackup -- -1
sudo tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet

echo "  Update MacTeX ..."
sudo tlmgr update --self --all --reinstall-forcibly-removed


echo "-----------------------------------------------------------------------"
echo ":: Install new dictionaries for Sublime Text 3"
git clone https://github.com/titoBouzout/Dictionaries.git ${HOME}/Library/Application\ Support/Sublime\ Text\ 3/Packages/Dictionaries/


## Set OS X preferences
# We will run this last because this will reload the shell
# source ./osx/osx.sh


echo "#######################################################################"
echo "Done. Restart the terminal and you're ready to go."


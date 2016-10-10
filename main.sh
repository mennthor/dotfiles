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


echo "-----------------------------------------------------------------------"
echo ":: Setting up neovim ::"
stow --dir=dotfiles --target=${HOME} -vD nvim  # Unstow to prevent symlinking the whole plugged folder
curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs \  # Install vim plug
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/colors/smyck.vim --create-dirs \  # Install smyck color theme
	https://raw.githubusercontent.com/hukl/Smyck-Color-Scheme/master/smyck.vim
stow --dir=dotfiles --target=${HOME} -v nvim  # Restow to install plugs from init.vim
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
echo ":: Restore app settings using mackup restore ::"
mackup restore


## Set OS X preferences
# We will run this last because this will reload the shell
# source ./osx/osx.sh


echo "#######################################################################"
echo "Done. Restart the terminal and you're ready to go."


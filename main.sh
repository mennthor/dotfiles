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


## Install `xcode commmand line tools`
xcode-select --install


## Install `homebrew` if not already done
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update `homebrew`
brew update

# Install all brew dependencies with `brew bundle` (see ./homebrew/Brewfile)
brew tap homebrew/bundle
brew bundle --file=./homebrew/Brewfile

# Free disk space from downloaded binaries
brew cask cleanup


## Setup the system python
# First install pip in the user folder ${HOME}/Library/Pythom/2.7
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
rm get-pip.py

# Tell python to prefer user packages (check later with `$ python -m site`)
echo "import sys; sys.path.insert(1,'${HOME}/Library/Python/2.7/lib/python/site-packages')" >> ${HOME}/Library/Python/2.7/lib/python/site-packages/local.pth

# Install all in pip_requirements file to user folder (similar to Brewfile)
pip install --upgrade --user -r "./osx/pip_requirements.txt"


## Link to Google Drive and Dropbox in home if on MacBookPro
if [ ! -d "${HOME}/Dropbox" ]; then
	echo "No Dropbox folder found in home. Linking /Volumes/nifty/Dropbox."
	ln -s /Volumes/nifty/Dropbox ${HOME}
fi
if [ ! -d "${HOME}/Google Drive" ]; then
	echo "No Google Drive folder found in home. Linking /Volumes/nifty/Google\ Drive."
	ln -s /Volumes/nifty/Google\ Drive ${HOME}
fi


## Link dotfiles and configs to $(HOME) using GNU `stow`
# Unstow with `stow --dir=dotfiles --target=${HOME} -vv -D package-name`
for d in `ls ./dotfiles`; do
    ( stow --dir=dotfiles --target=${HOME} -vv $d )
done


## Update mactex, anaconda and the system python
# First use new /etc/paths.d/TeX paths without starting a new terminal
eval `/usr/libexec/path_helper -s`

# Set some mactex settings
tlmgr option autobackup -- -1
tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet

# Then update tex and anaconda
tlmgr update --self --all --reinstall-forcibly-removed
conda update anaconda


## Restore app settings using `mackup restore`.
mackup restore


## Set OS X preferences
# We will run this last because this will reload the shell
# source ./osx/osx.sh



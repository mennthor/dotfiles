## Script to setup, update and upgrade the OSX system python
## without polluting the system install location.


# First install pip in the user folder ${HOME}/Library/Pythom/2.7
echo "  Installing pip ..."
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
rm get-pip.py

# Tell python to prefer user packages (check later with `$ python -m site`)
echo "  Create 'local.pth' in ~/Library/Python/..."
echo "import sys; sys.path.insert(1,'${HOME}/Library/Python/2.7/lib/python/site-packages')" >> ${HOME}/Library/Python/2.7/lib/python/site-packages/local.pth

# Install all in pip_requirements file to user folder (similar to Brewfile)
echo "  Upgrade and install packages in pip_requirements.txt ..."
${HOME}/Library/Python/2.7/bin/pip2 install --upgrade --user -r "./osx/pip_requirements.txt"
## Script to setup, update and upgrade the OSX system python
## without polluting the system install location.
# User folder is ~/Library/Python/2.7

echo "  Install pip in the user folder ~/Library/Python/2.7 ..."
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
rm get-pip.py

echo "  Create 'local.pth' in python user folder to prefer the user packages"
echo "  over the systems ones. Check paths later with `$ python -m site` ..."
echo "import sys; sys.path.insert(1,'${HOME}/Library/Python/2.7/lib/python/site-packages')" >> ${HOME}/Library/Python/2.7/lib/python/site-packages/local.pth

echo "  Upgrade and install packages from homebrew/pip_requirements.txt ..."
pip install --upgrade --user -r "./homebrew/pip_requirements.txt"

echo "  Install ipython 2 kernel for ipython2 notebook ..."
python -m pip install ipykernel --user
python -m ipykernel install --user --display-name "Python 2 (OSX)"
# http://ipython.readthedocs.io/en/stable/install/kernel_install.html

echo "  Install notebook extensions ..."
pip install --user https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master
jupyter-contrib-nbextension install --user
# https://github.com/ipython-contrib/jupyter_contrib_nbextensions

# Enable extensions in notebook section
jupyter-nbextension enable comment-uncomment/main  enabled
jupyter-nbextension enable collapsible_headings/main
jupyter-nbextension enable init_cell/main
jupyter-nbextension enable codefolding/main
jupyter-nbextension enable nbextensions_configurator/tree_tab/main
jupyter-nbextension enable ruler/main
jupyter-nbextension enable hide_input_all/main
# Enable extensions in tree section
jupyter-nbextension enable nbextensions_configurator/tree_tab/main

echo "  Make `python` link in py2 user folder to encapsulate the system python."
ln -s /usr/bin/python ${HOME}/Library/Python/2.7/bin/python
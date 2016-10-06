# Script to setup, update and upgrade the homebrew python3
# User folder is ~/Library/Python/3.5

echo "  Upgrade and install packages from homebrew/pip_requirements.txt ..."
pip3 install --upgrade --user -r "./homebrew/pip_requirements.txt"

echo "  Install ipython 3 kernel for ipython2 notebook ..."
python3 -m pip install ipykernel --user
python3 -m ipykernel install --user --display-name "Python 3 (Homebrew)"

echo "  Link 'jupyter-*' binaries in py3 user folder to 'jupyter3-*'."
cd ${HOME}/Library/Python/3.5/bin
for j in ./jupyter*; do
	ln -s $j "${j:0:9}3${j:9:100}";
done

echo "  Make `python` link in py3 user folder for make scripts using `python`."
# When py3 is the first path object, then python points to py3
ln -s /usr/local/bin/python3 ./python
cd -
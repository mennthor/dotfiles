# Script to setup, update and upgrade the homebrew python3
# User folder is ~/Library/Python/3.* (autodetected with PY3VERSION)

echo "  Upgrade and install packages from homebrew/pip_requirements.txt ..."
pip3 install --upgrade --user -r "./homebrew/pip_requirements.txt"

echo "  Install ipython 3 kernel for ipython notebook ..."
python3 -m pip install ipykernel --user
python3 -m ipykernel install --user --display-name "Python 3 (Homebrew)"

echo "  Link 'jupyter-*' binaries in py3 user folder to 'jupyter3-*'."
PY3VERSION=$(python3 -c "import sys; print('{}.{}'.format(*sys.version_info[:2]))")
cd ${HOME}/Library/Python/"$PY3VERSION"/bin
for j in ./jupyter*; do
	ln -s $j "${j:0:9}3${j:9:100}";
done

echo "  Make `python` link in py3 user folder for make scripts using `python`."
# When python3 is the first python in the PATH, then `python`/`pip` should
# consistenly point to `python3`/`pip` per default. This is set for py2 as well.
ln -s /usr/local/bin/python3 ./python
ln -s /usr/local/bin/pip3 ./pip
cd -
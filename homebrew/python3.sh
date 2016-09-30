# Script to setup, update and upgrade the homebrew python3

echo "  Upgrade and install packages from homebrew/pip_requirements.txt ..."
pip3 install --upgrade --user -r "./homebrew/pip_requirements.txt"

echo "  Install ipython 3 kernel for ipython2 notebook ..."
python3 -m pip install ipykernel --user
python3 -m ipykernel install --user --display-name "Python 3 (Homebrew)"

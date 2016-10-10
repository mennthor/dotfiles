# Neovim Setup

First install with homebrew using

```bash
brew tap neovim/neovim/neovim
brew install neovim
```

Python3 support is gained via

```bash
pip3 install neovim
```

To install plugins get [Vim-Plug](https://github.com/junegunn/vim-plug) via

```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This will also create the basic config folder structure in '~/.config/nvim'.
Plugins are downloaded to 'plugged' folder automatically.
'init.vim' is the equivalent of the '.vimrc' file for standard Vim.
 This is the basic 'init.vim' setup for the 'sensible' package and nothing else:

```bash
call plug#begin()
Plug 'tpope/vim-sensible'
call plug#end()
```

To install the plugins open `nvim` and execute `:PlugInstall` or call the command from the command line directly with `nvim -c PlugInstall -c qall`.


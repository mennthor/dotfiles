# README

This dotfiles repo takes a whole lot from [Dries Vints Dotfile Tutorial](https://driesvints.com/blog/getting-started-with-dotfiles).
His dotfiles can be found https://github.com/driesvints/dotfiles.

Lots of OSX specific system configuration commands are in [Mathias Bynens Dotfiles](https://github.com/mathiasbynens/dotfiles).

## Automatic Setup

The basic setup is done by simply running `main.sh`:
```bash
chmod 744 main.sh
./main.sh
```

This will currently install

- `xcode command line tools`
- `homebrew`
    + all `brew` programs selected in `homebrew/Brewfile`
- Setup the system python
    + Install `pip` to the user folder
    + Set a `.pth` file to prefer user packages
    + Update system packages specified in 'homebrew/pip_requirements.txt'
    + Install the ipykernel and notebook-extensions
- Setup the homebrew python3
    + Install packages specified in 'homebrew/pip_requirements.txt'
    + Install ipykernel3 for python2 notebook
- Link Google Drive and Dropbox folder to home if not exisitng yet
- Stow all dotfiles from 'dotfiles/' to home folder
- Update and setup MacTex
- Restore app settings using `mackup restore`
    + Those settings are stored in an iCloud drive, previously created using `mackup backup`

## Manual Steps

Manually we need to copy the ssh settings to the `~/.ssh` folder.

Also `Dropbox`, `Google Drive`, `Chrome` `Telegram` and `Slack` need a first time login.
For the cloud drives, the cloud folder location must be set at first startup of the app.
If the folder was backed up or was put on an external memory, nothing needs to be re-downloaded.

Unfortunately there a whole lot of OSX settings I didn't found a way to configure via command line.
My basic settings I do when setting up a new system are described in `osx/osx.md`.
Maybe there is a way to set all these per command line in one script. :) 

## Apps to install manually

- CSL USB Ethernet Driver

# README

This dotfiles repo takes a whole lot from [Dries Vints Dotfile Tutorial](https://driesvints.com/blog/getting-started-with-dotfiles).
His dotfiles are available at [github](https://github.com/driesvints/dotfiles/blob/master/install.sh).

Lots of OSX specific system configuration commands are in [Mathias Bynens Dotfiles](https://github.com/mathiasbynens/dotfiles).

## Automatic Setup

The basic setup is done by simply running `main.sh`:
```bash
chmod 744 main.sh
./main.sh
```

This will install `xcode command line tools`, `homebrew` and all `brew` programs selected in `homebrew/Brewfile`.
Then OSX system settings specified in `osx/osx.sh` are applied.
Lastly app settings are restored using `mackup restore`. Those settings are stored in the iCloud drive

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

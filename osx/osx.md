# TODO Set various OSX system setting per terminal command

## System Settings

- General
	+ Appearance: graphite
	+ Tick: Use dark menu and dock
	+ Highlight color: Graphite
	+ Sidebar icon size: small
	+ Default web browser: Chrome
	+ Tick: Ask to keep changes when closing docs
	+ Untick: Close windows when quitting
	+ Recent items: None
	+ Untick: Allow hand-off
- Screen Saver:
	Start after: Never
- Mission Control
	+ Untick: Automatically rearrange spaces
	+ Untick: When switching to an application switch to space
- Spotlight
	+ Untick: Bing, Bookmarks, Definition, Events, Spotlight Suggestions
	+ Untick: Allow Spotlight suggestions in spotlight and look up at the bottom
- Display
	+ Untick: Auto set brightness
- Energy saver:
	+ Battery
		* Turn display off: Never
		* Untick: hard disk to sleep
		* In menu bar, alt-click battery and choose: Show percentage
	+ Adapter
		* Turn display off: Never
		* Tick: Prevent from sleeping automatically when display off
		* Untick: Put hard disk to sleep
- Keyboard
	+ Keyboard
		* Enable key repeat instead of pop-up: 
		  `defaults write -g ApplePressAndHoldEnabled -bool false`
		* Set key repeat and delay to short (is overridden by Karabiner anyway)
		* Untick: adjust keyboard brightness in low light
	+ Text
		* Untick: Correct Spelling automatically
		* Remove preinstalled snippets
		* Unitck: Use smart quotes
	+ Shortcuts
		* Mission Control: Assign Ctrl+i to switch to i'th desktop
		* Change keyboard->Move focus to next window to <Cmd+^>
		* Untick all in Accessibility
		* App shortcuts: Add Finder: Back -> Cmd+ö, Forward -> Cmd+ä
		* At the bottom: Tick All controls
- Trackpad
	+ Point&Click
		* Tick: Tap to click
		* Tracking Speed to fourth point from right
		* Tick: silent click
	+ More gestures
		* Tick App Expose and set to four finger swipe down
- Sound
	+ Sound effects
		* Slide alert volume to mute
		* Untick: Play user interface sound effects
		* Tick: Show volume in menu bar 
- iCloud
	+ Untick all but iCloid Drive and Find my Mac
	+ In iCloudDrive sub-settings untick all
- Internet accounts
	+ Add Google Account for calendar and contacts
- Extensions
	- Share Menu: Untick all
- Bluetooth: Turn off when not needed
	+ Tick: Show in menu bar
- App Store: Click the lock
- Date & Time
	+ Clock: Tick show date under Date options
- Accessibility
	+ Display: Tick reduce transparency
	+ Mouse & Trackpad: 
		* Trackpad Options: Set scroll speed to third fastest
		* Tick enable dragging and choose three finger drag


### Dock

- Remove all but Finder, Mail, Chrome, Telegram, Terminal
- Set size to maximum
- Turn off magnification
- Animation: Scale
- Untick: Animate opening applications
- Tick: Automatically hide and show the dock

### Finder

- General
	+ Show these items on desktop: External disks
	+ New Finder windows shows: Downloads
	+ Untick: Open folder in new tab
- Sidebar
	+ Only tick: iCloudDrive, Downloads, tmenne, hard disks, external disks
- Advanced
	+ Show all filename extensions
	+ Search current folder
- In folder: Set to list view, sort by kind. Then right click and View Options
	+ Text size 11
	+ Show columns Size and Kind
	+ Untick: Show icon preview
	+ Click use as defaults

### Terminal

- Profiles
	+ Import theme smyck_custom and set as default
	+ Text: Change font to hack 11pt
	+ Window: Set size to 100x30
	+ Advanced:
		+ Untick: Audible bell
		+ Untick: Only when sound is muted 
		+ Untick: Set locale environment on startup.
		          The locales are set in .profile


## App settings

### Dropbox

- Set path to available folder (if available, otherwise re-download)
	+ MacBook: /Volumes/nifty
	+ MacMini: ~/
- Untick: Enable Camera Upload and Share Screenshots

### Google Drive

- Set path to available folder (if available, otherwise re-download)
	+ MacBook: /Volumes/nifty
	+ MacMini: ~/

### ResXtreme

- Set resolution to 2048 x 1280. Don't need to install the app.

### Telegram

- Advanced
	+ Untick: Sound effects 
	+ In-App sounds: None
	+ Tick: Convert emojis





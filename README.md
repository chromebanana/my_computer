```
    ____        __  _____ __
   / __ \____  / /_/ __(_) /__  _____
  / / / / __ \/ __/ /_/ / / _ \/ ___/
 / /_/ / /_/ / /_/ __/ / /  __(__  )
/_____/\____/\__/_/ /_/_/\___/____/

```
Dotfiles and setup scripts for my Mac.

This should allow me to quickly set up a new machine with my preferred development environment.

# Installation
To install:
```bash
curl https://raw.githubusercontent.com/chromebanana/my_computer/master/bootstrap.sh | bash
```
# Follow-up steps
These steps have not been (or cannot be) automated, but should be done after running the bootstrap script

## General
- [ ] sync iCloud docs
- [ ] configure Trackpad settings: "tap to click" and Mouse: “Secondary click” + Speed
- [ ] configure Keyboard settings: "Key Repeat" => FAST and "Delay Until Repeat" => SHORT (automation ideas [here](https://gist.github.com/brandonb927/3195465))
- [ ] log in to mail accounts
- [ ] sync Calendar with any shared calendars
- [ ] install [flux](https://justgetflux.com/)
- [ ] restore 1Password

## iTerm
- [ ] enable jump Words: iTerm → Preferences → Profiles → Keys → Key Mappings -> Presets... → Natural Text Editing
- [ ] add fonts https://github.com/romkatv/powerlevel10k/blob/master/font.md
- [ ] install themes  etc https://gist.github.com/kevin-smets/8568070 and powerlevel10k

Thanks to:
 - [riversteve](https://raw.githubusercontent.com/riverssteve/dotfiles/master/bootstrap.sh)
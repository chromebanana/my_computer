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
sudo curl https://raw.githubusercontent.com/chromebanana/my_computer/master/bootstrap.sh | bash
```
# Follow-up steps
These steps have not been (or cannot be) automated, but should be done after running the bootstrap script

## General
- [ ] sync iCloud docs
- [ ] configure Trackpad settings: "tap to click" and Mouse: “Secondary click” + Speed
- [ ] configure Keyboard settings: "Key Repeat" => FAST and "Delay Until Repeat" => SHORT (automation ideas [here](https://gist.github.com/brandonb927/3195465))
- [ ] add mail accounts
- [ ] change mail settings to sync manually, uncheck "Follow-Up Suggestions"
- [ ] install [flux](https://justgetflux.com/)
- [ ] install Arc browser extensions: Pocket; 1Password; DuckDuckGo; uBlock Origin

## Github
- [ ] create SSH key ([guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))
- [ ] add SSH key to Github

## iTerm
- [ ] install oh-my-zsh
- [ ] enable jump Words: iTerm → Preferences → Profiles → Keys → Key Mappings -> Presets... → Natural Text Editing
- [ ] install powerlevel10k
- [ ] add fonts https://github.com/romkatv/powerlevel10k/blob/master/font.md
- [ ] install Solarized Dark Theme

Thanks to:
 - [riversteve](https://raw.githubusercontent.com/riverssteve/dotfiles/master/bootstrap.sh)

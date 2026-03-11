```
    ____        __  _____ __
   / __ \____  / /_/ __(_) /__  _____
  / / / / __ \/ __/ /_/ / / _ \/ ___/
 / /_/ / /_/ / /_/ __/ / /  __(__  )
/_____/\____/\__/_/ /_/_/\___/____/

```
Dotfiles and setup scripts for my Mac.

This should allow me to quickly set up a new machine with my preferred development environment.

# How it works

This repo uses a **bare git repo** with `~/.config` as the work tree. The git database lives at `~/.dotfiles.git`, keeping `~/.config` free of a `.git` directory.

An alias in `.zshrc` makes this seamless:
```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME/.config'
```

Common commands:
```bash
dotfiles status              # show changes to tracked files
dotfiles add <file>          # start tracking a new file
dotfiles commit -m "..."     # commit
dotfiles push                # push to GitHub
dotfiles status -u           # show untracked files (discover new stuff in ~/.config)
```

# Installation

On a fresh machine:
```bash
curl -fsSL https://raw.githubusercontent.com/chromebanana/my_computer/main/bootstrap.sh | bash
```

This will install Homebrew, clone the repo as a bare git repo, checkout dotfiles into `~/.config`,
and run `install.sh` to set up symlinks and packages. If existing files in `~/.config` conflict,
they're backed up to `~/.config-backup`.

# Follow-up steps

These steps have not been (or cannot be) automated, but should be done after installation.

## General
- [ ] sync iCloud docs
- [ ] configure Trackpad settings: "tap to click" and Mouse: "Secondary click" + Speed
- [ ] configure Keyboard settings: "Key Repeat" => FAST and "Delay Until Repeat" => SHORT (automation ideas [here](https://gist.github.com/brandonb927/3195465))
- [ ] add mail accounts
- [ ] change mail settings to sync manually, uncheck "Follow-Up Suggestions"
- [ ] install [flux](https://justgetflux.com/)
- [ ] install Arc browser extensions: Pocket; 1Password; DuckDuckGo; uBlock Origin

## Github
- [ ] create SSH key ([guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))
- [ ] add SSH key to Github

## iTerm (for reference -- not currently using)
- [ ] install oh-my-zsh
- [ ] enable jump Words: iTerm → Preferences → Profiles → Keys → Key Mappings -> Presets... → Natural Text Editing
- [ ] install powerlevel10k
- [ ] add fonts https://github.com/romkatv/powerlevel10k/blob/master/font.md
- [ ] install Solarized Dark Theme

Thanks to:
 - [riversteve](https://raw.githubusercontent.com/riverssteve/dotfiles/master/bootstrap.sh)

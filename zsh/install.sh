source "${DOTFILES}/utils.sh"
pinfo "Installing oh-my-zsh"

# Set up git to use HTTPS instead of SSH for github
git config --global url."https://github.com/".insteadOf "git@github.com:"

# Clone Oh My Zsh directly with HTTPS
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  pinfo "Cloning Oh My Zsh repository..."
  GIT_TERMINAL_PROMPT=0 git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" || {
    pfail "Could not clone Oh My Zsh repository"
    exit 1
  }
  pinfo "Oh My Zsh installed successfully"
else
  pinfo "Oh My Zsh already installed"
fi
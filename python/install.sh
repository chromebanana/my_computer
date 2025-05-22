if ! command -v pyenv &> /dev/null; then
    brew install pyenv
fi

pinfo "Installing python in pyenv"
pyenv install 3.12.9
pyenv global 3.12.9
pyenv virtualenvwrapper_lazy

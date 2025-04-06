#!/bin/bash

function install_brew() {
    if [ ! -d "/opt/homebrew" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

function install_brew_packages() {
    local packages=(
        bat
        fzf
        gnupg
        httpie
        kitty
        koekeishiya/formulae/skhd
        kubectl
        lazydocker
	nvim
        pnpm
        ripgrep
	stow
        thefuck
        tlrc
        visual-studio-code
        wget
        yazi
        zoxide
    )
    brew install ${packages[@]}
}

function install_npm_global_packages() {
    local packages=(
        typescript
        typescript-language-server
        prettier
        eslint
        eslint-plugin-react
        eslint-plugin-react-hooks
        eslint-plugin-import
        eslint-plugin-jsx-a11y
        eslint-plugin-prettier
        eslint-config-prettier
    )
    npm install -g ${packages[@]}
}

function install_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    nvm install --lts
    nvm use --lts
}

function install_vim_plug() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_vim_plug
install_nvm
install_npm_global_packages
install_brew
install_brew_packages

echo SUCCESS

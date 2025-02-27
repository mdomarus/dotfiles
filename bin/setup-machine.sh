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
        kitty
        koekeishiya/formulae/skhd
        stow
        thefuck
        visual-studio-code
        wget
        yazi
        zoxide
    )
    brew install ${packages[@]}
}

function install_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
}

install_nvm
install_brew
install_brew_packages

echo SUCCESS

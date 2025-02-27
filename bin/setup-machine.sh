#!/bin/bash

function install_packages() {
    local packages=(
        bat
        fzf
        kitty
        koekeishiya/formulae/skhd
        stow
        thefuck
        visual-studio-code
        yazi
        zoxide
    )
    brew install ${packages[@]}
}

function install_nvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
}

install_nvm
install_packages

echo SUCCESS

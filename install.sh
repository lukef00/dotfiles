#!/bin/sh

HERE="$(pwd)"
REPOS="${HOME}/repos"

install_packages() {
    cd "${HERE}"
    sudo pacman -Syu
    sudo pacman -S --needed - < packages.list
    sudo usermod -a -G docker libvirt $(whoami)

    # enable services
    sudo systemctl enable cups
    sudo systemctl enable tlp
    sudo systemctl enable docker
    sudo systemctl enable libvirtd
}

copy_dots() {
    # create user directories
    cd $HOME
    mkdir .desktop downloads templates notes music images videos $REPOS

    # copy dotfiles
    cd "${HERE}/src/"
    rm "${HOME}/.bashrc"
    stow -t ~ *
}

mpd_setup() {
    # mpd setup
    mkdir -p ${HOME}/.mpd-data/{playlists,ncmpcpp}
    touch ${HOME}/.mpd-data/{db,log,pid,sticker,state}_file
    systemctl enable --now --user mpd
}

misc() {
    cd $REPOS
    git clone https://dylanaraps/pfetch
    cd pfetch
    sudo make install
    cd ..

    # install Nerd Font (Fira Code)
    mkdir -p "${HOME}/.local/share/fonts/FiraCode"
    cd "${HOME}/.local/share/fonts/FiraCode"
    curl -fLo "fonts.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/6.2/Fira_Code_v6.2.zip
    unzip fonts.zip
    rm fonts.zip

    # install gruvbox gtk theme
    cd "$REPOS"
    git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk gruvbox
    cd gruvbox
    mkdir -p ~/.local/share/{themes,icons}
    mv themes/* ~/.local/share/themes/
    mv icons/* ~/.local/share/icons/
}

development() {
    # install nvm, latest node and python language server
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source "${HOME}/.bashrc"
    nvm install node
    npm i -g npm
    npm i -g pyright

    # install packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

install_packages
copy_dots
mpd_setup
misc
development

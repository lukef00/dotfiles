#!/bin/sh

HERE="$(pwd)"
REPOS="${HOME}/repos"
USER="$(whoami)"

install_packages() {
    cd "${HERE}"
    sudo pacman -Syu
    sudo pacman -S --needed - < packages.list
    sudo usermod -a -G docker,libvirt $USER

    # enable services
    sudo systemctl enable cups
    sudo systemctl enable tlp
    sudo systemctl enable docker
    sudo systemctl enable libvirtd
}

copy_dots() {
    # create user directories
    cd "${HOME}"
    rm .bashrc
    mkdir "${HOME}/.config/mako" .desktop downloads templates notes music images videos $REPOS -p

    # copy dotfiles
    cd "${HERE}/src/"
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
    git clone https://github.com/dylanaraps/pfetch
    cd pfetch
    sudo make install
    cd ..

    # create folder for additional fonts
    mkdir -p "${HOME}/.local/share/fonts"

    # install gruvbox gtk theme
    cd "$REPOS"
    git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk gruvbox
    cd gruvbox
    mkdir -p ~/.local/share/{themes,icons}
    mv themes/* ~/.local/share/themes/
    mv icons/* ~/.local/share/icons/
}

development() {
    # install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source "${HOME}/.bashrc"

    # install packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

install_packages
copy_dots
mpd_setup
misc
development

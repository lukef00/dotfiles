#!/bin/sh

HERE="$(pwd)"

# Function order
# 1. copy dotfiles
# 2. install nerd fonts
# 3. replace user specific content
# 4. create mpd setup 

pywal_setup() {
    # replace username in waybar style.css
    sed -i "s/luke/$(whoami)/" ${HOME}/waybar/style.css

    # create simlink for mako (notification daemon)
    ln -s ${HOME}/.cache/wal/mako ${HOME}/.config/mako/config
}

mpd_dir_setup() {
    # create directories for music player daemon
    mkdir -p ${HOME}/.mpd-data/{playlists,ncmpcpp}
    touch ${HOME}/.mpd-data/{db,log,pid,sticker,state}_file
}

copy_dotfiles() {
    cd "${HERE}/src/"
    rm "${HOME}/.bashrc"
    stow -t ~ *
}

install_nerd_fonts() {
}

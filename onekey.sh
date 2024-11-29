#!/usr/bin/env bash
[ -z "$DOT_PATH" ] && DOT_PATH="$PWD"

do_backup() {
    if [ -e "$1" ]; then
        today=`date +%Y%m%d_%H:%M:%S`
        mkdir  $HOME/bak_$today
        [ -e "$i" ] && [ ! -L "$i" ] && mv -v "$HOME/$1" "$HOME/bak_$today/bak_$1";
        ret="$?"
    fi
}
lnif() {
    if [ -e "$1" ]; then
        ln -snf "$1" "$2"
    fi
    ret="$?"
}
main () {
    for SRC in `cat $DOT_PATH/dotfiles.list`
    do
        lnif $DOT_PATH/$SRC $HOME/$SRC
    done
}

main

#!/usr/bin/env bash
[ -z "$DOT_PATH" ] && DOT_PATH="$HOME/dotfiles"
lnif() {
	if [ -e "$1" ]; then
		ln -sf "$1" "$2"
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

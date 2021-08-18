my dotfiles
mkdir ~/.vim/pack/<key>
mkdir ~/.vim/pack/<key>/start,opt
git submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/<key>/start/vim-airline
git add .vim/pack/<key>/start
git commit


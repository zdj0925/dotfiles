my dotfiles
```
mkdir ~/.vim/pack/<key>
mkdir ~/.vim/pack/<key>/start,opt
git submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/<key>/start/vim-airline
git add .vim/pack/<key>/start
git commit
---------------- delete plug ---------
git rm -f .vim/pack/<key>/start/vim-ariline
cd ~/dotfiles
git submodule deinit -f -- .vim/pack/<key>/start/vim-airline
rm -fr .git/modules/.vim/pack/<key>/start/vim-airline
git rm -f .vim/pack/<key>/start/vim-ariline

---------------- update plug ---------
git submodule sync
git submodule update --init 
git submodule update --init --recursive
```

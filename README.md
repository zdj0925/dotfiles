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
---------------- FAQ        ---------
Q1:
   error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly before end of the underlying stream
   error: 4195 bytes of body are still expected
A1:
git config --global http.version HTTP/1.1
Q2:
   error: RPC failed; curl 18 transfer closed with outstanding read data remaining
   error: 6145 bytes of body are still expected
A2:
   git config --global http.postBuffer 524288000
```

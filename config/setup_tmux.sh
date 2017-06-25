set -x

cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s $HOME/.tmux/.tmux.conf
cp $HOME/.tmux/.tmux.conf.local $HOME

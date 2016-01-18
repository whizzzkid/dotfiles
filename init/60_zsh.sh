#Ubuntu only.
is_ubuntu || return 1

FONTDIR=$HOME'/powerline-fonts'
git clone https://github.com/powerline/fonts.git $FONTDIR
sh $FONTDIR'/'install.sh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

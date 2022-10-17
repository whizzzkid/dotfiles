# source profile like .bashrc
if [ -f /etc/profile ]; then
    source /etc/profile
fi

if [ -f $HOME/.profile ]; then
    source $HOME/.profile
fi

#!/usr/bin/env bash

# Get the dirname of this script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

GREEN='\033[0;32m'
NC='\033[0m' # No Color


# appends string only if it doesn't exist already in the file
function append() {
    str=$1
    file=$2
    found=$(grep -xq "$str" $file)

    if $found; then
        echo "${GREEN}$file already contains \"$str\" ${NC}"
    else
        echo $str >> $file
        [ $? -eq 0 ] && echo "${GREEN}updated $file${NC}"
    fi
}

echo ""
echo "UPDATING BASHRC/BASH_PROFILE"
echo "============================"
echo ""

if [ -e $HOME/.bash_profile ]; then
    append "source $DIR/bash/bashrc" $HOME/.bash_profile
    [ $? -eq 0 ] && echo "${GREEN} appended to $HOME/.bash_profile${NC}"
elif [ -e $HOME/.bashrc ]; then
    append "source $DIR/bash/bashrc" $HOME/.bashrc
    [ $? -eq 0 ] && echo "${GREEN} appended to $HOME/.bashrc${NC}"
else
    ln -s $DIR/bash/bashrc $HOME/.bash_profile
    ln -s $DIR/bash/bashrc $HOME/.bashrc
    [ $? -eq 0 ] && echo "${GREEN} created softlinks $HOME/.bashrc and $HOME/.bash_profile${NC}"
fi

echo ""
echo "UPDATING VIMRC"
echo "=============="
echo ""

if [ ! \( -e $HOME/.vimrc \) ]; then
    ln -s $DIR/vim/vimrc $HOME/.vimrc
    [ $? -eq 0 ] && echo "${GREEN}Created a softlink at $HOME/.vimrc${NC}"
else
    echo "${GREEN}$HOME/.vimrc already exists. No action${NC}"
fi

if [ ! \( -e $HOME/.vim \) ]; then
    ln -s $DIR/vim/options $HOME/.vim
    [ $? -eq 0 ] && echo "${GREEN}Created a softlink at $HOME/.vim${NC}"
else
    echo "${GREEN}$HOME/.vim already exists. No action${NC}"
fi

echo ""
echo "UPDATING GITCONFIG"
echo "=============="
echo ""

if [ ! \( -e $HOME/.gitconfig \) ]; then
    ln -s $DIR/git/gitconfig $HOME/.gitconfig
    [ $? -eq 0 ] && echo "${GREEN}Created a softlink at $HOME/.gitconfig${NC}"
else
    echo "${GREEN}$HOME/.gitconfig already exists. No action${NC}"
fi

echo ""
echo "Done"
echo ""

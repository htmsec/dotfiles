#!/usr/bin/env bash
function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        mv $target $target.df.bak
	echo "backed up $HOME/$target to $target.df.bak "
    fi

    ln -sf ${source} ${target}
    echo "$target --> $source"
}

function unlink_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
        unlink ${target}
        mv $target.df.bak $target
	echo "restoring $target from $HOME/$target.df.bak"
    fi
}

if [ "$1" = "vim" ]; then
    for i in _vim*
    do
       link_file $i
    done
elif [ "$1" = "restore" ]; then
    for i in _*
    do
        unlink_file $i
    done
    exit
else
    for i in _*
    do
        link_file $i
    done
fi

git submodule update --init --recursive
git submodule foreach --recursive git pull origin master

# Install all the bundles
vim +BundleInstall +qall

# Setup Command-T (required ruby, rake)
cd _vim/bundle/Command-T
rake make


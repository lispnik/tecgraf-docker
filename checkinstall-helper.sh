#!/bin/sh

checkinstall \
    -y \
    --pakdir /packages \
    --maintainer '"Matthew Kennedy <burnsidemk@gmail.com>"' \
    --pkgname "tecgraf-$1" \
    --pkglicense MIT \
    --pkggroup "$2" \
    --requires "$3" \
    --install=no \
    --pkgversion "$(svn info -r HEAD --show-item revision)" \
    --stripso=no \
    -- \
    sh ../install.sh "$1" 

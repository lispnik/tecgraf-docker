#!/bin/sh

checkinstall \
    -y \
    --pakdir /packages/ \
    --maintainer '"Matthew Kennedy <burnsidemk@gmail.com>"' \
    --pkgname "$1" \
    --pkglicense MIT \
    --pkggroup "$2" \
    --requires "$3" \
    --install=no \
    -- \
    sh ../install.sh "$1" 

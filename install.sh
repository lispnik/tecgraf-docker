#!/bin/sh

case "$1" in
    im|cd|iup)
	install -D -t /usr/lib/x86_64-linux-gnu lib/Linux*/*.so
	;;
    im-dev|cd-dev|iup-dev)
	install -D -t /usr/lib/x86_64-linux-gnu lib/Linux*/*.a
	install -D -t /usr/include include/*.h
	;;
    im-doc|cd-doc|iup-doc)
	mkdir /usr/share/doc/"$1"
	cp -r html /usr/share/doc/"$1"
	;;
    *)
	;;
esac

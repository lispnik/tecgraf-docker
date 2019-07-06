case $1 in
    im)
	install -D -t /usr/lib/x86_64-linux-gnu lib/Linux*/*.so
	;;
    im-dev)
	install -D -t /usr/lib/x86_64-linux-gnu lib/Linux*/*.a
	install -D -t /usr/include include/*.h
	;;
    im-doc)
	mkdir /usr/share/doc/im-doc/
	cp -r html /usr/share/doc/im-doc/
	;;
    *)
	;;
esac

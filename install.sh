#!/bin/bash
set -ex
case "$1" in
    im|cd|iup)
	install -D -t /usr/lib/x86_64-linux-gnu -m 644 lib/Linux*/*.so
	;;
    im-dev|cd-dev|iup-dev)
	install -D -t /usr/lib/x86_64-linux-gnu -m 644 lib/Linux*/*.a
	install -D -t /usr/include include/*.h
	;;
    im-doc|cd-doc|iup-doc)
	mkdir /usr/share/doc/"$1"
	cp -r html /usr/share/doc/"$1"
	;;
    im-lua|cd-lua|iup-lua)
	find lib/Linux* -maxdepth 2 -type d -name Lua\* |while read dir; do
	    find "$dir" -type f -name \*.so | while read sofile; do
		install -D -t /usr/lib/x86_64-linux-gnu -m 644 "$sofile"
	    done
	    lua_dir=$(basename "$dir")
	    suffix=${lua_dir:3}
	    version=${suffix:0:1}.${suffix:1:2}
	    module=${1/-/}
	    lua_libdir=/usr/lib/x86_64-linux-gnu/lua/${version}
	    mkdir -p "$lua_libdir" || true
	    case "$1" in
		im-lua)
		    ln -rs /usr/lib/x86_64-linux-gnu/libimlua"$suffix".so "$lua_libdir"/imlua.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libimlua_fftw"$suffix".so "$lua_libdir"/imlua_fftw.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libimlua_jp2"$suffix".so "$lua_libdir"/imlua_jp2.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libimlua_process"$suffix".so "$lua_libdir"/imlua_process.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libimlua_process_omp"$suffix".so "$lua_libdir"/imlua_process_omp.so
		    ;;
		cd-lua)
		    ln -rs /usr/lib/x86_64-linux-gnu/libcdluagl"$suffix".so "$lua_libdir"/cdluagl.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libcdluacontextplus"$suffix".so "$lua_libdir"/cdluacontextplus.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libcdluaim"$suffix".so "$lua_libdir"/cdluaim.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libcdlua"$suffix".so "$lua_libdir"/cdlua.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libcdluapdf"$suffix".so "$lua_libdir"/cdluapdf.so
		    ;;
		iup-lua)
		    ln -rs /usr/lib/x86_64-linux-gnu/libiuplua"$suffix".so "$lua_libdir"/iuplua.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiuplua_mglplot"$suffix".so "$lua_libdir"/iuplua_mglplot.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiuplua_plot"$suffix".so "$lua_libdir"/iuplua_plot.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiuplua_scintilla"$suffix".so "$lua_libdir"/iuplua_scintilla.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluacd"$suffix".so "$lua_libdir"/iupluacd.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluacontrols"$suffix".so "$lua_libdir"/iupluacontrols.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluagl"$suffix".so "$lua_libdir"/iupluagl.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluaim"$suffix".so "$lua_libdir"/iupluaim.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluaimglib"$suffix".so "$lua_libdir"/iupluaimglib.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluascripterdlg"$suffix".so "$lua_libdir"/iupluascripterdlg.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluatuio"$suffix".so "$lua_libdir"/iupluatuio.so
		    ln -rs /usr/lib/x86_64-linux-gnu/libiupluaweb"$suffix".so "$lua_libdir"/iupluaweb.so
		    ;;
		*)
		    ;;
	    esac
	done
	;;
    *)
	;;
esac

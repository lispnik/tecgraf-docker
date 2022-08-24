#!/bin/bash
set -e
svn checkout http://svn.code.sf.net/p/imtoolkit/im/trunk/im im &
svn checkout http://svn.code.sf.net/p/canvasdraw/cd/trunk/cd cd &
svn checkout http://svn.code.sf.net/p/iup/iup/trunk/iup iup &
wait
./build.sh im
./build.sh cd
./build.sh iup
im_description="IM: An Imaging Toolkit
IM is a toolkit for image representation, storage, capture and
processing. The main goal of the library is to provide a simple API
and abstraction of imaging for scientific applications.
The most popular file formats are supported: TIFF, BMP, PNG, JPEG, GIF
and AVI. Image representation includes scientific data types, and
about a hundred Image Processing operations are available.
This work was developed at Tecgraf/PUC-Rio by means of the partnership
with PETROBRAS/CENPES.
"
cd_description="CD: A 2D Graphics Library
CD is a vector graphics toolkit with device independent output. It is
implemented in several platforms using native graphics libraries:
Microsoft Windows (GDI) and X-Windows (XLIB).
The library contains functions to support both vector and image
applications, and the visualization surface can be either a window or
a more abstract surface, such as Image, Clipboard, Metafile, PS, and
so on.
This work was developed at Tecgraf/PUC-Rio by means of the partnership
with PETROBRAS/CENPES.
"
iup_description="IUP Portable User Interface
IUP is a multi-platform toolkit for building graphical user
interfaces. It offers a simple API in three basic languages: C, Lua
and LED. IUP's purpose is to allow a program source code to be
compiled in different systems without any modification. Its main
advantages are:
 * high performance, due to the fact that it uses native interface
   elements.
 * fast learning by the user, due to the simplicity of its API.
This work was developed at Tecgraf/PUC-Rio by means of the partnership
with PETROBRAS/CENPES.
"
cd im \
    && ../checkinstall-helper.sh \
	   "im" "graphics" "zlib1g" "${im_description}This package contains the shared libraries." \
    && ../checkinstall-helper.sh \
	   "im-dev" "graphics" "zlib1g-dev" "${im_description}This package contains the development libraries and header files." \
    && ../checkinstall-helper.sh \
	   "im-doc" "graphics" "" "${im_description}This package contains the documentation." \
    && ../checkinstall-helper.sh \
	   "im-lua" "graphics" "" "${im_description}This package contains the LUA libraries." \
    && cd ../
cd cd \
    && ../checkinstall-helper.sh \
	   "cd" "graphics" "tecgraf-im" "${cd_description}This package contains the shared libraries." \
    && ../checkinstall-helper.sh \
	   "cd-dev" "graphics" "tecgraf-im-dev" "${cd_description}This package contains the development libraries and header files." \
    && ../checkinstall-helper.sh \
	   "cd-doc" "graphics" "" "${cd_description}This package contains the documentation." \
    && ../checkinstall-helper.sh \
	   "cd-lua" "graphics" "" "${cd_description}This package contains the LUA libraries." \
    && cd ../
cd iup \
    && ../checkinstall-helper.sh \
	   "iup" "libs" "tecgraf-cd,libgtk-3-0,libwebkitgtk-3.0-0" "${iup_description}This package contains the shared libraries." \
    && ../checkinstall-helper.sh \
	   "iup-dev" "libs" "tecgraf-cd-dev" "${iup_description}This package contains the development libraries and header files." \
    && ../checkinstall-helper.sh \
	   "iup-doc" "libs" "" "${iup_description}This package contains the documentation." \
    && ../checkinstall-helper.sh \
	   "iup-lua" "libs" "" "${iup_description}This package contains the LUA libraries." \
    && cd ../

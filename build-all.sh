#!/bin/sh
svn checkout https://svn.code.sf.net/p/imtoolkit/im/trunk/im im
svn checkout https://svn.code.sf.net/p/canvasdraw/cd/trunk/cd cd
svn checkout https://svn.code.sf.net/p/iup/iup/trunk/iup iup
sh build.sh im
sh build.sh cd
sh build.sh iup
mkdir /packages
cd im \
    && ../checkinstall-helper.sh "im" "graphics" "zlib1g" \
    && ../checkinstall-helper.sh "im-dev" "graphics" "zlib1g-dev" \
    && ../checkinstall-helper.sh "im-doc" "graphics" "" \
    && cd ../
cd cd \
    && ../checkinstall-helper.sh "cd" "graphics" "tecgraf-im" \
    && ../checkinstall-helper.sh "cd-dev" "graphics" "tecgraf-im-dev" \
    && ../checkinstall-helper.sh "cd-doc" "graphics" "" \
    && cd ../
cd iup \
    && ../checkinstall-helper.sh "iup" "libs" "tecgraf-cd,libgtk-3-0,libwebkitgtk-3.0-0" \
    && ../checkinstall-helper.sh "iup-dev" "libs" "tecgraf-cd-dev" \
    && ../checkinstall-helper.sh "iup-doc" "libs" "" \
    && cd ../
ls -l /packages

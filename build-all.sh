#!/bin/sh
echo here
svn checkout https://svn.code.sf.net/p/imtoolkit/im/trunk/im im
svn checkout https://svn.code.sf.net/p/canvasdraw/cd/trunk/cd cd
svn checkout https://svn.code.sf.net/p/iup/iup/trunk/iup iup
sh build.sh im
sh build.sh cd
sh build.sh iup
cd im \
    && ../checkinstall-helper.sh "im" "graphics" "zlib1g" \
    && ../checkinstall-helper.sh "im-dev" "graphics" "zlib1g-dev" \
    && ../checkinstall-helper.sh "im-doc" "graphics" "" \
    && cd ../
cd cd \
    && ../checkinstall-helper.sh "cd" "graphics" "im" \
    && ../checkinstall-helper.sh "cd-dev" "graphics" "im-dev" \
    && ../checkinstall-helper.sh "cd-doc" "graphics" "" \
    && cd ../
cd iup \
    && ../checkinstall-helper.sh "iup" "graphics" "cd" \
    && ../checkinstall-helper.sh "iup-dev" "graphics" "cd-dev" \
    && ../checkinstall-helper.sh "iup-doc" "graphics" "" \
    && cd ../
ls -l /packages

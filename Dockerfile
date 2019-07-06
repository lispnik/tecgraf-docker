FROM ubuntu:18.04
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y subversion libreadline-dev g++ libgtk-3-dev libgl1-mesa-dev libwebkitgtk-3.0-dev \
	lua5.1 liblua5.1-dev \
	lsb-release \
	libftgl-dev \
	zlib1g-dev checkinstall 
RUN svn checkout https://svn.code.sf.net/p/imtoolkit/im/trunk/im im
RUN svn checkout https://svn.code.sf.net/p/canvasdraw/cd/trunk/cd cd
RUN svn checkout https://svn.code.sf.net/p/iup/iup/trunk/iup iup
COPY build.sh .
RUN sh build.sh im
RUN sh build.sh cd
RUN sh build.sh iup
COPY install.sh .
RUN apt-get install -y atool
RUN cd im \
	&& checkinstall -y \
	--pakdir /packages/ \
	--maintainer '"Matthew Kennedy <burnsidemk@gmail.com>"' \
	--pkgname im \
	--pkglicense MIT \
	--pkggroup graphics \
	--requires zlib1g \
	--install=no \
	-- \
	sh ../install.sh im \
	&& checkinstall -y \
	--pakdir /packages/ \
	--maintainer '"Matthew Kennedy <burnsidemk@gmail.com>"' \
	--pkgname im-dev \
	--pkglicense MIT \
	--pkggroup graphics \
	--requires zlib1g-dev \
	--install=no \
	-- \
	sh ../install.sh im-dev \
	&& checkinstall -y \
	--pakdir /packages/ \
	--maintainer '"Matthew Kennedy <burnsidemk@gmail.com>"' \
	--pkgname im-doc \
	--pkglicense MIT \
	--pkggroup graphics \
	--install=no \
	-- \
	sh ../install.sh im-doc

RUN for i in /packages/*.deb; do als "$i"; done

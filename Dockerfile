FROM ubuntu:22.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y subversion libreadline-dev g++ libgtk-3-dev libgl1-mesa-dev libwebkit2gtk-4.0-dev \
	lua5.1 liblua5.1-dev \
	lua5.2 liblua5.2-dev \
	lua5.3 liblua5.3-dev \
	lua5.4 liblua5.4-dev \
	lsb-release \
	libftgl-dev \
	libfftw3-dev \
	zlib1g-dev checkinstall \
	atool
COPY build.sh build-all.sh install.sh checkinstall-helper.sh ./

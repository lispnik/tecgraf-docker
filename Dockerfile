FROM ubuntu:18.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y subversion libreadline-dev g++ libgtk-3-dev libgl1-mesa-dev libwebkitgtk-3.0-dev \
	lua5.1 liblua5.1-dev \
	lua5.2 liblua5.2-dev \
	lua5.3 liblua5.3-dev \
	lsb-release \
	libftgl-dev \
	zlib1g-dev checkinstall \
	atool
COPY build.sh build-all.sh install.sh checkinstall-helper.sh ./

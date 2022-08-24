#!/bin/bash
set -e
cd "$1"
for lua_suffix in 5.1 5.2 5.3 5.4; do
    lua_version=${lua_suffix//\./}
    USE_LUA_VERSION=$lua_version \
		   LUA_LIB=/usr/lib/x86_64-linux-gnu \
		   LUA_SUFFIX=$lua_suffix \
		   LUA_INC=/usr/include/lua${lua_suffix} \
		   LUA_BIN=/usr/bin \
		   make
done
echo "RESULTS!!!"
find lib -type f |sort

#!/bin/sh

set -e

AWTRIX_BETA=${AWTRIX_BETA:-false}
AUTOUPDATE=${AUTOUPDATE:-true}
File="/data/awtrix.jar"

if [ "$AUTOUPDATE" = true ]; then
  if [ "$AWTRIX_BETA" = true ]; then
    AWTRIX_DL_URL=https://blueforcer.de/awtrix/beta/awtrix.jar
  elif [ "$AWTRIX_BETA" = "nightly" ]; then
    AWTRIX_DL_URL=https://blueforcer.de/awtrix/nightly/awtrix.jar
  else
    AWTRIX_DL_URL=https://blueforcer.de/awtrix/stable/awtrix.jar
  fi
  if [ ! -f "$File" ]; then
    wget $AWTRIX_DL_URL -O $File
    touch /data/1
  fi

fi

java -jar $File

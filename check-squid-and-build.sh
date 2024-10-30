#!/usr/bin/env bash

FLAG_FILE="/tmp/squid-version-updated"
BUILD_DIR="/opt/src/squid-fedora-buildah-podman"

stat "${FLAG_FILE}" 
if [ "$?" -eq "0" ]
then
  rm -v "${FLAG_FILE}"
  cd "${BUILD_DIR}"
  bash run.sh
fi

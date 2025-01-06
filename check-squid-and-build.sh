#!/usr/bin/env bash

env

FLAG_FILE="/tmp/squid-version-updated"
BUILD_DIR="/opt/src/squid-fedora-buildah-podman"

if [ -f "${FLAG_FILE}" ]
then
  rm -v "${FLAG_FILE}"
  cd "${BUILD_DIR}"
  bash run.sh
fi

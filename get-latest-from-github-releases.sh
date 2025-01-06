#!/usr/bin/env bash

REPO="squid-cache/squid"
LATEST_RELEASE_URL="https://api.github.com/repos/${REPO}/releases/latest"
ALL_RELEASES_URL="https://api.github.com/repos/${REPO}/releases"

OUTPUT=$(curl -s "${LATEST_RELEASE_URL}")
echo "${OUTPUT}" | jq -r ".assets[] | select(.name | test(\".tar.gz$\") ) | .browser_download_url"

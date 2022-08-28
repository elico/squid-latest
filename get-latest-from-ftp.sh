#!/usr/bin/env bash

FTP_HTTP_MIRROR="http://mirror.marwan.ma/squid/software/"

LATEST_FILE=$(curl -s "${FTP_HTTP_MIRROR}" | egrep -o "squid\-[0-9\.]+tar\.(xz|gz|bz2)" | tail -1)

echo "${FTP_HTTP_MIRROR}${LATEST_FILE}"

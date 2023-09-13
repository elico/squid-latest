#!/usr/bin/env bash

#URL=$(bash get-latest-from-ftp.sh)
URL=$(ruby get-latest-squid-version.rb)

curl -s "${URL}.asc" -o "in.asc"

ruby latest-json-from-asc.rb "in.asc" "${URL}" | tee latest.json.in

cat latest.json.in |jq -r .url | grep "tar.xz$"
RES="$?"
if [ "${RES}" -gt "0" ];then
	echo "Url doesn't contain a tar.xz file"
	exit 0
fi

diff latest.json latest.json.in || \
	mv latest.json.in latest.json
# push
 
git add latest.json && \
	git commit -m "periodic check"
	git push origin

#!/usr/bin/env bash

#URL=$(bash get-latest-from-ftp.sh)
#URL=$(ruby get-latest-squid-version.rb)
URL=$( bash get-latest-from-github-releases.sh )
FLAG_FILE=$(head -1 update-flag-file)

curl -s "${URL}.asc" -o "in.asc"

ruby latest-json-from-asc.rb "in.asc" "${URL}" | tee latest.json.in

cat latest.json.in |jq -r .url | grep "tar.gz$"
RES="$?"
if [ "${RES}" -gt "0" ];then
	echo "Url doesn't contain a tar.gz file"
	exit 0
fi

diff latest.json latest.json.in || mv latest.json.in latest.json

RES=$( find latest.json -mmin -1 -type f|wc -l )
if [ "${RES}" -gt "0" ]
then
	touch "${FLAG_FILE}"
fi
# push
 
git add latest.json && \
	git commit -m "periodic check"
	git push origin

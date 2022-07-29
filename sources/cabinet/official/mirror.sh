#!/bin/bash

cd $(dirname $0)

if [[ $(jq -r .source.url meta.json) == http* ]]
then
  CURLOPTS="--compressed -L -c /tmp/cookies -A 'Chrome/51.0.2704.103%20Safari/537.36'"
  curl $CURLOPTS -o official.html $(jq -r .source.url meta.json)
fi

cd -

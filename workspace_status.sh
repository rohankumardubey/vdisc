#!/bin/bash

HEAD=$(git rev-parse HEAD)
SHORT=$(git rev-parse --short HEAD)

if [ -z "$(git status --porcelain)" ]; then
    echo "STABLE_GIT_STATUS ${HEAD}"
    echo "STABLE_GIT_SHA_SHORT ${SHORT}"
else
    echo "STABLE_GIT_STATUS ${HEAD}-dirty"
    echo "STABLE_GIT_SHA_SHORT ${SHORT}-dirty"
fi

NUM_COMMITS=$(git log --pretty=oneline | wc -l|awk '{print $1}')
echo "STABLE_GIT_NUM_COMMITS ${NUM_COMMITS}"

echo "STABLE_SEMVER_FROM_GIT" "0.1.${NUM_COMMITS}+git${SHORT}"

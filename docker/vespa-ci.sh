#!/bin/bash
# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
set -e
set -x

if [ "$(uname)" != "Darwin" ]; then
    free -m
fi

df -h
df -h .

pwd
RELATIVE_DIR=$(dirname "${BASH_SOURCE[0]}")
DIR=$(cd "${RELATIVE_DIR}" && pwd)

cd $DIR

BUILD_DOCKER_IMAGE="vespabuild"
CI_DOCKER_IMAGE="vespaci"

docker build -t "$BUILD_DOCKER_IMAGE" -f build/Dockerfile .

# Create a temporary copy of the rpm spec file inside docker directory so it can be referenced by the Dockerfile
rm -rf tmp; mkdir tmp
cp -p vespa.spec tmp/vespa.spec

docker build -t "$CI_DOCKER_IMAGE" -f ci/Dockerfile .

docker run --rm -v ${DIR}/..:/java-design-patterns --entrypoint /vespa-ci-internal.sh "$CI_DOCKER_IMAGE" \
   2>&1 | tee vespa-ci-$(date +%Y-%m-%dT%H:%M:%S%z).log

# Becuase of piping docker run to tee above
exit ${PIPESTATUS[0]}


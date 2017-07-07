#!/bin/bash
# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
set -e
set -x

if [ "$(uname)" != "Darwin" ]; then
    free -m
fi

df -h .

NUM_CORES=$(nproc --all)

#SOURCE_DIR=~/java-design-patterns
#mkdir "${SOURCE_DIR}"
#git clone --no-hardlinks /java-design-patterns "${SOURCE_DIR}"

#cd "${SOURCE_DIR}"

whoami
cd java-design-patterns
pwd
ls -l

time mvn clean install -U -V -e -q -DskipTests=true -Dmaven.javadoc.skip=true

export DISPLAY=:1.0
/usr/bin/Xvfb :1 -screen 0 1152x900x8&
time mvn install -T 2.0C -nsu -q -V -e -Dmaven.test.redirectTestOutputToFile=true

#MAVEN_OPTS="-Xms128m -Xmx512m" mvn install -Dmaven.test.redirectTestOutputToFile=true

echo "Success!"

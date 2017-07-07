# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.

# Hack to speed up jar packing for now
%define __jar_repack %{nil}

# Force special prefix for Vespa
%define _prefix /opt/vespa

Name:           vespa
Version:        VESPA_VERSION
Release:        1%{?dist}
Summary:        Vespa - The open big data serving engine
Group:          Applications/Databases
License:        Commercial
Source0:        vespa-%{version}.tar.gz

BuildRequires: epel-release 
BuildRequires: centos-release-scl
BuildRequires: devtoolset-6-gcc-c++
BuildRequires: devtoolset-6-libatomic-devel
BuildRequires: devtoolset-6-binutils
BuildRequires: Judy-devel
BuildRequires: cmake3
BuildRequires: lz4-devel
BuildRequires: libzstd-devel
BuildRequires: zlib-devel
BuildRequires: maven
BuildRequires: libicu-devel
BuildRequires: llvm3.9-devel
BuildRequires: java-1.8.0-openjdk-devel
BuildRequires: openssl-devel
BuildRequires: rpm-build
BuildRequires: make
BuildRequires: vespa-boost-devel >= 1.59.0-6
BuildRequires: vespa-cppunit-devel >= 1.12.1-6
BuildRequires: vespa-libtorrent-devel >= 1.0.11-6
BuildRequires: vespa-zookeeper-c-client-devel >= 3.4.9-6
BuildRequires: systemd
Requires: epel-release 
Requires: Judy
Requires: lz4
Requires: libzstd
Requires: zlib
Requires: libicu
Requires: llvm3.9
Requires: java-1.8.0-openjdk
Requires: openssl
Requires: vespa-boost >= 1.59.0-6
Requires: vespa-cppunit >= 1.12.1-6
Requires: vespa-libtorrent >= 1.0.11-6
Requires: vespa-zookeeper-c-client >= 3.4.9-6
Requires(pre): shadow-utils

%description

Vespa - The engine

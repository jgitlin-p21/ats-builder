#!/bin/bash

set -e
set -x

# Install Development tools
yum -y groupinstall "Development Tools"

# Install EPEL, needed for yaml-cpp-devel
yum -y install yum-utils
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable epel

# rpmbuild command recommends to use `builder:builder` as user:group.
/bin/yum -y install shadow-utils
/usr/sbin/useradd -u 1000 builder

mkdir -p /home/builder/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
chown -R builder:builder /home/builder/rpmbuild

# Install Apache Traffic Server dependencies
/bin/yum -y install autoconf automake libtool pkgconfig perl-ExtUtils-MakeMaker \
    gcc openssl-devel pcre-devel ncurses-devel libcurl-devel libcap-devel \
    hwloc-devel flex git python3 rpmdevtools rpm-build rpmlint gnupg2 sudo \
    boost-devel tcl-devel xz-devel gcc-c++ yaml-cpp-devel

# Clean up for smaller image size
/bin/yum clean all && rm -rf /var/cache/yum
rm -f /tmp/setup.sh

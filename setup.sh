#!/bin/bash

set -e
set -x

# Install Development tools
#yum -y groupinstall "Development Tools" && \

# rpmbuild command recommends to use `builder:builder` as user:group.
useradd -u 1000 builder

mkdir -p /home/builder/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
chown -R builder:builder /home/builder/rpmbuild

# Install Apache Traffic Server dependencies
yum install autoconf automake libtool pkgconfig perl-ExtUtils-MakeMaker gcc openssl-devel pcre-devel ncurses-devel libcurl-devel libcap-devel hwloc-devel flex git

# Clean up for smaller image size
yum clean all && rm -rf /var/cache/yum
rm /tmp/setup.sh
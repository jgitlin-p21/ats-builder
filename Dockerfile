FROM amazonlinux:2.0.20191217.0
LABEL MAINTAINER="Josh Gitlin <jgitlin@pinnacle21.com>"

COPY setup.sh /tmp

RUN /bin/bash /tmp/setup.sh

WORKDIR /home/builder/rpmbuild

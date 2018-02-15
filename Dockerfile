# docker build -t patrikx3/openwrt-insomnia .
# docker container ls
# docker exec -it <containerIdOrName> bash
# docker attach <id>
# docker run -t -i patrikx3/openwrt-insomnia bash
FROM debian:jessie
MAINTAINER patrikx3/openwrt-insomnia - Patrik Laszlo - alabard@gmail.com

ARG OPENWRT_VERSION_TOTAL=SNAPSHOT
#ARG OPENWRT_BRANCH=openwrt-17.01
ENV OPENWRT_VERSION_TOTAL=${OPENWRT_VERSION_TOTAL}
#ENV OPENWRT_BRANCH=${OPENWRT_BRANCH}
ENV DEBIAN_FRONTEND=noninteractive
ENV FORCE_UNSAFE_CONFIGURE=1
ENV SHELL=/bin/bash

RUN apt-get -y update
RUN apt-get -y upgrade

# for stretch / buster / testing / bullseye
# libboost1.55-dev => libboost-dev
# openjdk-7-jdk => openjdk-9-jdk
# python2.6-dev => python-dev - (though not existing in jessie)
RUN apt -y install asciidoc bash bc bcc bin86 binutils build-essential bzip2 cmake curl ncdu fastjar file flex gawk gcc genisoimage gettext git git-core intltool jikespg libboost1.55-dev	libgtk2.0-dev libncurses5-dev libssl-dev libusb-dev libxml-parser-perl make mc nano openjdk-7-jdk	patch perl-modules python python-dev rsync ruby sdcc sshpass sharutils software-properties-common subversion quilt unzip util-linux wget xsltproc xz-utils zlib1g-dev mercurial sudo
#before it was needed nethack*, still?
# nethack

RUN echo "docker:x:10000:docker" >> "/etc/group"
RUN useradd -u 10000 -g 10000 -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN mkdir -p /etc/sudoers.d
RUN echo 'docker ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

RUN mkdir build
RUN chown docker:docker /build

# clean up
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get clean -y

USER docker

WORKDIR build

RUN git clone https://git.openwrt.org/project/usign.git
WORKDIR /build/usign
RUN cmake .
RUN make
RUN sudo cp ./usign /usr/bin/usign
RUN sudo chmod +x /usr/bin/usign

WORKDIR /build
#RUN git clone -b ${OPENWRT_BRANCH} git://git.openwrt.org/source.git
RUN git clone git://git.openwrt.org/openwrt/openwrt.git source
WORKDIR /build/source

# once OPENWRT_VERSION_TOTAL != SNAPSHOT checkout the verions

#RUN git checkout tags/v${OPENWRT_VERSION_TOTAL}
RUN git checkout master


RUN cp feeds.conf.default feeds.conf
RUN echo 'src-git node https://github.com/nxhack/openwrt-node-packages.git' >> feeds.conf
RUN echo 'src-git redis https://github.com/patrikx3/openwrt-redis.git' >> feeds.conf
RUN echo 'src-git mariadb https://github.com/patrikx3/openwrt-mariadb.git' >> feeds.conf
RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a
RUN ./scripts/feeds update node
RUN rm ./package/feeds/packages/node*
#RUN rm ./package/feeds/packages/node-arduino-firmata
#RUN rm ./package/feeds/packages/node-cylon
#RUN rm ./package/feeds/packages/node-hid
#RUN rm ./package/feeds/packages/node-serialport
RUN ./scripts/feeds install -a -p node
RUN ./scripts/feeds update redis
RUN ./scripts/feeds install -a -p  redis
RUN ./scripts/feeds update mariadb
RUN ./scripts/feeds install -a -p mariadb

COPY make-scripts /build/source

#RUN echo "set linenumbers" > "/home/docker/.nanorc"
RUN echo "alias ll='ls -l'" >> /home/docker/.bashrc
#RUN echo "sudo chown -R docker:docker /build" >> /home/docker/.bashrc
RUN echo "SELECTED_EDITOR=\"/bin/nano\"" > /home/docker/.selected_editor

ENV PATH="/build/source:${PATH}"

RUN sudo find /build -user root -exec chown docker:docker {} \;

CMD /bin/bash

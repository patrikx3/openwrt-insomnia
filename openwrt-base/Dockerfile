# docker build -t patrikx3/openwrt-insomnia:base .
# docker container ls
# docker exec -it <containerIdOrName> bash
# docker attach <id>
# docker run -t -i patrikx3/openwrt-base bash
FROM debian:buster
MAINTAINER patrikx3/openwrt-insomnia:base - Patrik Laszlo - alabard@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
ENV FORCE_UNSAFE_CONFIGURE=1
ENV SHELL=/bin/bash

RUN apt-get -y update
# if we are using testing
#RUN apt-get -y --with-new-pkgs upgrade

# for stretch / buster / testing / bullseye
# libboost1.55-dev => libboost-dev
# openjdk-7-jdk => default-jdk
# python2.6-dev => python-dev - (though not existing in jessie)

# classpath
# apt install openjdk-8* ecj java-wrappers nasm bzr libpcap-ng-dev
# apt install ecj java-wrappers nasm bzr libpcap-dev
# libpcap-ng-dev => libpcap-dev

# jeff added to the build bots => pwgen locales ccache

# based on => https://openwrt.org/docs/guide-developer/build-system/install-buildsystem

RUN apt -y install asciidoc bash bc time bcc bin86 binutils build-essential bzip2 cmake curl default-jdk fastjar file flex gawk gcc genisoimage gettext git git-core intltool jikespg libboost-dev libgtk2.0-dev libncurses5-dev libssl-dev libusb-dev libxml-parser-perl make mc mercurial nano ncdu patch perl-modules python python-dev quilt rsync ruby sdcc sharutils software-properties-common sshpass subversion sudo unzip util-linux wget xsltproc xz-utils zlib1g-dev g++-multilib swig python3 python3-dev python3-distutils python3-setuptools help2man libelf-dev ecj java-wrappers nasm bzr libpcap-dev pwgen locales ccache java-propose-classpath libncursesw5-dev
#before it was needed nethack*, still?
# nethack

RUN echo "docker:x:10000:docker" >> "/etc/group"
RUN useradd -u 10000 -g 10000 -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN mkdir -p /etc/sudoers.d
RUN echo 'docker ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

ENV PATH="/build/source:${PATH}"

RUN mkdir build
RUN chown docker:docker /build

# clean up
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get clean -y

USER docker

#RUN echo "set linenumbers" > "/home/docker/.nanorc"
RUN echo "alias ll='ls -l'" >> /home/docker/.bashrc
#RUN echo "sudo chown -R docker:docker /build" >> /home/docker/.bashrc
RUN echo "SELECTED_EDITOR=\"/bin/nano\"" > /home/docker/.selected_editor

WORKDIR build

RUN git clone https://git.openwrt.org/project/usign.git
WORKDIR /build/usign
RUN cmake .
RUN make
RUN sudo cp ./usign /usr/bin/usign
RUN sudo chmod +x /usr/bin/usign

RUN sudo unlink /etc/localtime
RUN sudo ln -s /usr/share/zoneinfo/CET /etc/localtime

WORKDIR /build

CMD /bin/bash

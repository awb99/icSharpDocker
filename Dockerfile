FROM debian:jessie

USER root

# git has an issue with the repositories below
RUN apt-get update \
    && apt-get install -y git

#  Jupyter
#RUN apt-get install -y libc6-dev 
RUN apt-get install -y \
            python \
            python-pip \ 
            libzmq-dev \
            python2.7-dev 
# mv jupyter jupytertest    The PIP installer will install to /usr/local/bin/jupyter
#RUN pip install jupyter


# contrib packages not contained in normal jessie install.This means most required packages will not be found.
RUN echo "deb http://http.us.debian.org/debian jessie main contrib non-free"  > /etc/apt/sources.list
RUN apt-get update \
    && apt-get update \
    && apt-get install -y  wget curl


# mono (from opensuse user repositories; gets installed to /opt/mono/)
# debian user repos formono have a very old mono version
RUN apt-get install -y wget
RUN echo 'deb http://download.opensuse.org/repositories/home:/tpokorra:/mono/Debian_8.0/ /' >> /etc/apt/sources.list.d/mono-opt.list 
RUN cd /tmp \
    && wget http://download.opensuse.org/repositories/home:tpokorra:mono/Debian_8.0/Release.key  \
    && apt-key add - < Release.key  \
    && apt-get update \
    && apt-get install -y mono-opt 
RUN . /opt/mono/env.sh

# mozilla root certificates so that https requests do work (nuget requires this)
RUN mozroots --import --sync

# compile icsharp
RUN echo "now building icsharp from source"
RUN mkdir /home/condauser/ \
    &&  cd /home/condauser
COPY /build_icsharp2.sh /home/condauser/
RUN cd /home/condauser \
    && git clone https://github.com/awb99/icsharp.git 
#    && . /home/condauser/build_icsharp2.sh


# install engine
COPY /kernel.json /home/condauser/




EXPOSE 8899

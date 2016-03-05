FROM debian:wheezy

RUN echo "hello word" 

USER root

# 1.  MONO
RUN apt-get update \
	&& apt-get install -y curl wget \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/3.12.0 main" > /etc/apt/sources.list.d/mono-xamarin.list \
	&& apt-get update \
	&& apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget \
	&& rm -rf /var/lib/apt/lists/*

#2.  Jupyter
RUN apt-get install -y wget
# UN wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
# RUN bash Anaconda-2.3.0-Linux-x86_64.sh
# RUN conda update jupyter 


RUN apt-get install -y python python-pip python-dev libzmq-dev
# mv jupyter jupytertest    The PIP installer will install to /usr/local/bin/jupyter
RUN pip install jupyter


EXPOSE 8899

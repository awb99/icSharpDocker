FROM debian:jessie

USER root

# contrib packages not contained in nomral jessie install.This means most required packages will not be found.
RUN echo "deb http://http.us.debian.org/debian jessie main contrib non-free"  > /etc/apt/sources.list
RUN apt-get update \
    && apt-get update

#  Jupyter
#RUN apt-get install -y libc6-dev 
RUN apt-get install -y python python-pip python-dev libzmq-dev 
#python2.7-dev 
# mv jupyter jupytertest    The PIP installer will install to /usr/local/bin/jupyter
#RUN pip install jupyter


# MONO
#RUN apt-get update \
#	&& apt-get install -y curl wget \
#	&& rm -rf /var/lib/apt/lists/*

# RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

# RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/3.12.0 main" > /etc/apt/sources.list.d/mono-xamarin.list \
#	&& apt-get update \
#	&& apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget \
#	&& rm -rf /var/lib/apt/lists/*




EXPOSE 8899

FROM debian:jessie

USER root

# contrib packages not contained in normal jessie install.This means most required packages will not be found.
RUN echo "deb http://http.us.debian.org/debian jessie main contrib non-free"  > /etc/apt/sources.list
RUN apt-get update \
    && apt-get update

RUN apt-get install -y git-core wget curl

#  Jupyter
#RUN apt-get install -y libc6-dev 
RUN apt-get install -y python python-pip libzmq-dev 
#python2.7-dev 
# mv jupyter jupytertest    The PIP installer will install to /usr/local/bin/jupyter
#RUN pip install jupyter

# mono (from opensuse user repositories; gets installed to /opt/mono/)
# debian user repos formono have a very old mono version
RUN apt-get install -y wget
RUN echo 'deb http://download.opensuse.org/repositories/home:/tpokorra:/mono/Debian_8.0/ /' >> /etc/apt/sources.list.d/mono-opt.list 
RUN wget http://download.opensuse.org/repositories/home:tpokorra:mono/Debian_8.0/Release.key
RUN apt-key add - < Release.key  
RUN apt-get update \
    && apt-get install -y mono-opt


# comile icsharp (the awb version)
RUN apt-get install -y git-core \
    && git clone https://github.com/awb99/icsharp.git \
    && mono ./.nuget/NuGet.exe restore ./ScriptCs.sln \
    && xbuild ./iCSharp.sln /property:Configuration=Release /nologo /verbosity:normal
#Executable is under:  icsharp/Kernel/bin/Release
# mono Kernel/bin/Release/iCSharp.Kernel.exe     will show the aruments not provided; the compilation of iCSharp worked.

# install engine
ADD /kernel.json /icsharp




EXPOSE 8899

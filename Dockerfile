FROM debian

RUN echo "hello word" 

# install mono
# add debian repository
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
# write the echoed line into the file on the right
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
# update packets - this installs mono..
RUN sudo apt-get update -y
# The package mono-complete should be installed to install everything - this should cover most cases of “assembly not found” errors.
RUN apt-get install mono-complete -y
# mono-dbg -  has the .mdb files which mono uses for stack traces in managed code... so that exceptions are logged properly.
RUN apt-get install mono-dbg -y                 
# mono-runtime-db - has the debug info gdb uses for bugs in mono itself
RUN apt-get install mono-runtime-dbg -y
RUN mozroots --import --machine --sync
RUN echo "Mono Install finished!"
RUN mono --version

EXPOSE 8899

# icSharpDocker
docker image to run icSharp (c# kernel) in jupyter


## how to build the docker image:
git pull
docker build -t ic2 .


## to run a terminal in the docker image (useful for development)
docker run -i -t -p 8888:8888 ic2  /bin/bash  

## to run the final version (production)
docker run -i -t -p 8888:8888 ic2


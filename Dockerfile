# docker build . -t simplescalar
# docker run -v $PWD:/root/ -ti simplescalar /bin/bash
# cd /root && ./install_simple_scalar.sh
# It should work! You can use the current directory as a sandbox visible both inside the Docker image and from your computer.
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y sudo wget
# and is copied here so that Docker can cache its effect.
RUN apt-get install -y bison flex gzip gcc-multilib libz1 vim libncurses5 libbz2-1.0 make

COPY . .

RUN ./install_simple_scalar.sh
# set default shell executable to bash instead of sh, needed to run source
SHELL ["/bin/bash", "-c"] 
# reload global variables
RUN source ~/.bashrc

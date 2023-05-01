FROM simgrid/unstable

ARG DEBIAN_FRONTEND noninteractive

RUN apt update -y
RUN apt install -y \
    g++ python3 cmake libboost-dev libboost-context-dev  \
    libboost-stacktrace-dev libevent-dev nlohmann-json3-dev \
    graphviz graphviz-dev

RUN cd /source/simgrid.git && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt/simgrid . && \
    make -j`nproc` && make install



FROM centos7-ssh

RUN yum install -y gcc-c++ gdb git make socat which && yum clean all 
RUN cd /tmp && git clone https://github.com/sysprogs/CMake.git && cd CMake && mkdir build && cd build && ../configure && make -j16 && make install && cd ../.. && rm -rf CMake

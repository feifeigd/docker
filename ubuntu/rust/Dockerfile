
FROM ubuntu

# The Rust toolchain to user when building our image. Set by `hooks/build`
ARG TOOLCHAIN=stable

RUN apt-get update && apt-get install -y build-essential cmake curl file git musl-tools sudo xutils-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && useradd rust --user-group --create-home --shell /bin/bash --groups sudo \
    && echo "export USER=rust">> /home/rust/.bashrc

# Allow sudo without a password
ADD sudoers /etc/sudoers.d/nopasswd

# Run all further code as user `rust`, and create our working directories as the appropriate user.
USER rust
RUN mkdir -p /home/rust/libs /home/rust/src

# Set up our path with all our binary directories, including those for the musl-gcc toolchain and for our Rust toolchain.
ENV PATH=/home/rust/.cargo/bin:/home/usr/local/musl/bin:$PATH

# Install our Rust toolchain and the `musl` target. We patch the command-line we pass to the installer so that it won't attempt to interact with the user or fool around with TTYs. We also set the default `--target` to musl so that our users don't need to keep overriding it manually.
RUN curl https://sh.rustup.rs -sSf|sh -s -- -y --default-toolchain $TOOLCHAIN && rustup target add x86_64-unknown-linux-musl
ADD cargo-config.toml /home/rust/.cargo/config

# We'll build our libraries in subdirectories of /home/rust/libs.  Please
# clean up when you're done.
WORKDIR /home/rust/libs

# Build a static library version of OpenSSL using musl-libc.  This is
# needed by the popular Rust `hyper` crate.
RUN VERS=1.1.1b && \
    curl -O https://www.openssl.org/source/openssl-$VERS.tar.gz && \
    tar xvzf openssl-$VERS.tar.gz && cd openssl-$VERS && \
    env CC=musl-gcc ./config --prefix=/usr/local/musl && \
    env C_INCLUDE_PATH=/usr/local/musl/include/ make depend && \
    make && sudo make install && \
    cd .. && rm -rf openssl-$VERS.tar.gz openssl-$VERS
ENV OPENSSL_DIR=/usr/local/musl/ \
    OPENSSL_INCLUDE_DIR=/usr/local/musl/include/ \
    DEP_OPENSSL_INCLUDE=/usr/local/musl/include/ \
    OPENSSL_LIB_DIR=/usr/local/musl/lib/ \
    OPENSSL_STATIC=1

# Expect our source code to live in /home/rust/src.We'll run the build as user `rust`, which will be uid 1000,gid 1000 outside the container.
WORKDIR /home/rust/src


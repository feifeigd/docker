
FROM ubuntu

# The Rust toolchain to user when building our image. Set by `hooks/build`
ARG TOOLCHAIN=stable

RUN apt-get update && apt-get install -y curl file musl-tools sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && useradd rust --user-group --create-home --shell /bin/bash --groups sudo 

# Allow sudo without a password
ADD sudoers /etc/sudoers.d/nopasswd
ADD .bashrc /home/rust/.bashrc

# Run all further code as user `rust`, and create our working directories as the appropriate user.
USER rust
RUN mkdir -p /home/rust/libs /home/rust/src

# Set up our path with all our binary directories, including those for the musl-gcc toolchain and for our Rust toolchain.
ENV PATH=/home/rust/.cargo/bin:/home/usr/local/musl/bin:$PATH

# Install our Rust toolchain and the `musl` target. We patch the command-line we pass to the installer so that it won't attempt to interact with the user or fool around with TTYs. We also set the default `--target` to musl so that our users don't need to keep overriding it manually.
RUN curl https://sh.rustup.rs -sSf|sh -s -- -y --default-toolchain $TOOLCHAIN && rustup target add x86_64-unknown-linux-musl
ADD cargo-config.toml /home/rust/.cargo/config

# Expect our source code to live in /home/rust/src.We'll run the build as user `rust`, which will be uid 1000,gid 1000 outside the container.
WORKDIR /home/rust/src


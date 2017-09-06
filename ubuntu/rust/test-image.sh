#!/bin/bash

# Make bash fail much more aggressively on errors.
set -euo pipefail

# Make sure we can build our main container.
sudo docker build -t rust-ubuntu .

# Make sure we can build a static executable.
sudo docker container run --rm -it rust-ubuntu bash -c "
set  -euo pipefail
export USER=rust
cargo new testme --bin
cd testme
cargo build
echo 'Checking to make sure it is not a dynamic executable'
if ldd target/x86_64-unknown-linux-musl/debug/testme; then
	echo 'Executable is not static!' 1>&2
	echo 'FAIL.' 1>&2
	exit 1
fi
"

echo 'Ok, Tests passwd.' 1>&2


FROM debian:buster as wabt

# Build wabt
RUN apt-get update && \
    apt-get install -y clang cmake git && \
    git clone --recursive https://github.com/WebAssembly/wabt && \
    cd wabt && \
    make

FROM debian:buster

# Copy wabt binaries
COPY --from=wabt /wabt/bin/ /usr/local/bin/

# Install zig
RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61 && \
    echo 'deb http://dl.bintray.com/dryzig/zig-debian buster main' | tee -a /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y zig

# Install llvm
RUN apt-get install -y llvm
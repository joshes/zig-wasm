# Zig WASM

Dockerized zig wasm environment based on this [gist](https://gist.github.com/josephg/873a21d4558fd69aeccea19c3df96672).

```sh
## Build the image
git clone https://github.com/joshes/zig-wasm
cd zig-wasm
docker build -t zigwasm .

## Compile `add.zig`
docker run -w /data -v $(pwd):/data --rm zigwasm zig build-lib --release-small -target wasm32-freestanding add.zig

## Run the node example
docker run -w /data -v $(pwd):/data --rm node:latest run.js
```

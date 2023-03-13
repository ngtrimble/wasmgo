#!/bin/sh

mkdir -p dist

pushd client
GOOS=js GOARCH=wasm tinygo build -o ../dist/app.wasm
cp -r views/*.html ../dist
cp $(tinygo env TINYGOROOT)/targets/wasm_exec.js ../dist
popd

pushd server
#tinygo build -no-debug -target=wasi -o ../dist/server.wasm
#GOOS=js GOARCH=wasm go build -ldflags="-s -w" -o ../dist/server.wasm .
go build -o ../dist/server .
popd

pushd dist
popd

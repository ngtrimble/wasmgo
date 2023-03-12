#!/bin/sh

pushd client
GOOS=js GOARCH=wasm go build -o ../dist/app.wasm
cp -r views/ ../dist
popd

pushd server
go build -o ../dist/server .
popd

pushd dist
cp "$(go env GOROOT)/misc/wasm/wasm_exec.js" .
popd

# wasmgo

## Introduction

Demonstrates use of WASM with Go and a JavaScript shim that ships with Go. The 
support that comes from WASM and Go is fairly basic. This shows clearly the 
value that a well designed framework can provide to work with the DOM and to 
automatically create functions to marshal to and from the JavaScript Virtual
Machine.

## Dependencies

To run these examples you need:

* Go / Tinygo (see build.sh)
* sh
* Wasmer

## Build 

```shell
./build.sh
```

## Run

```shell
./run.sh
```

Open your browser to http://localhost:8080

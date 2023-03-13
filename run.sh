#!/bin/sh

#pushd dist
# # Run using wasmer, a portable Virtual Machine and not OS or Arch dependent
# # None of these work, they all exit prematurely on http.ListenAndServe.
# # Does WASI or tinygo not support concurrency? Does Go proper not support WASI 
# # and just WASM? So many questions...
# # 
# # https://bytecodealliance.org/articles/wasi-threads
# #wasmer run server.wasm .
# #wasmedge server.wasm
# #wasmtime server.wasm
# ./server -servedir .
# popd

# Kinda novel way of serving the current directory using Go's http library
# Pros: Does not require one to create an additional application to do client dev
# Cons: Still requires installation of an additional package.
# pushd dist
# go install github.com/shurcooL/goexec
# goexec "http.ListenAndServe(\":8080\", http.FileServer(http.Dir(\".\")))"
# popd

# Serve current directory with inline program using 'go run'
# Pros: No dependencies other than Go
# Cons: Places Go code right in script
# pushd dist
# cat <<-EOF > server.go
# package main
# import "net/http"
# func main() { 
#     http.ListenAndServe(":8080", http.FileServer(http.Dir(".")))
# }
# EOF
# go run server.go
# popd

# pushd dist
# caddy file-server --listen ":8080"
# popd 

pushd dist
./server -servedir .
popd

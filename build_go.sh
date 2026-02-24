#!/bin/bash

rm -rf go

protoc --go_out=. --go-grpc_out=. $(find -name "*.proto")

current_dir=$(pwd)
go_dirs=$(find go -maxdepth 1 -mindepth 1 -type d)
for go_dir in $go_dirs; do
    cd $go_dir
    go mod init github.com/petrolmuffin/sandboxmessage-rpc/go/${go_dir##*/}
    go mod tidy
    cd $current_dir
done
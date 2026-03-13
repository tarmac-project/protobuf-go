# protobuf-go

[![GoDoc](https://godoc.org/github.com/tarmac-project/protobuf-go?status.svg)](https://godoc.org/github.com/tarmac-project/protobuf-go)

This repository contains generated Go packages for interacting with
[Tarmac](https://github.com/tarmac-project/tarmac) via Protobuf.

The source Protobuf files are located in the
[protobuf-definitions](https://github.com/tarmac-project/protobuf-definitions)
repository.

The generated packages in this repository are produced with
`protoc-gen-go-lite`. The generated APIs include helpers such as `MarshalVT`
and `UnmarshalVT`, but those helpers are provided by go-lite in this repo's
current toolchain.

## Regenerating Code

Run `make build` from this repository to regenerate the checked-in Go files from
`../protobuf-definitions`.

If the definitions repository is located elsewhere, override the source path:

```console
make build PROTO_DEFINITIONS_DIR=/path/to/protobuf-definitions
```

The build target regenerates code from the schema source and syncs the generated
`*.pb.go` files into this repository's `sdk/` tree.

While the packages within this repository are generally meant for internal
tooling, users of Tarmac may also find them useful.

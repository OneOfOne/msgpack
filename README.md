# MessagePack encoding for Golang

[![Build Status](https://travis-ci.org/oneofone/msgpack.svg)](https://travis-ci.org/oneofone/msgpack)
[![PkgGoDev](https://pkg.go.dev/badge/go.oneofone.dev/msgpack/v5)](https://pkg.go.dev/go.oneofone.dev/msgpack/v5)
[![Documentation](https://img.shields.io/badge/msgpack-documentation-informational)](https://msgpack.uptrace.dev/)
[![Chat](https://discordapp.com/api/guilds/752070105847955518/widget.png)](https://discord.gg/rWtp5Aj)

# This is a fork of [vmihailenco/msgpack](vmihailenco/msgpack/v5) that contains some optimizations and bug fixes

> :heart:
> [**Uptrace.dev** - All-in-one tool to optimize performance and monitor errors & logs](https://github.com/uptrace/uptrace)

- [Documentation](https://msgpack.uptrace.dev)
- [Reference](https://pkg.go.dev/go.oneofone.dev/msgpack/v5)
- [Examples](https://pkg.go.dev/go.oneofone.dev/msgpack/v5#pkg-examples)

Other projects you may like:

- [Bun](https://bun.uptrace.dev) - fast and simple SQL client for PostgreSQL, MySQL, and SQLite.
- [BunRouter](https://bunrouter.uptrace.dev/) - fast and flexible HTTP router for Go.

## Features

- Primitives, arrays, maps, structs, time.Time and interface{}.
- Appengine \*datastore.Key and datastore.Cursor.
- [CustomEncoder]/[CustomDecoder] interfaces for custom encoding.
- [Extensions](https://pkg.go.dev/go.oneofone.dev/msgpack/v5#example-RegisterExt) to encode
  type information.
- Renaming fields via `msgpack:"my_field_name"` and alias via `msgpack:"alias:another_name"`.
- Omitting individual empty fields via `msgpack:",omitempty"` tag or all
  [empty fields in a struct](https://pkg.go.dev/go.oneofone.dev/msgpack/v5#example-Marshal-OmitEmpty).
- [Map keys sorting](https://pkg.go.dev/go.oneofone.dev/msgpack/v5#Encoder.SetSortMapKeys).
- Encoding/decoding all
  [structs as arrays](https://pkg.go.dev/go.oneofone.dev/msgpack/v5#Encoder.UseArrayEncodedStructs)
  or
  [individual structs](https://pkg.go.dev/go.oneofone.dev/msgpack/v5#example-Marshal-AsArray).
- [Encoder.SetCustomStructTag] with [Decoder.SetCustomStructTag] can turn msgpack into drop-in
  replacement for any tag.
- Simple but very fast and efficient
  [queries](https://pkg.go.dev/go.oneofone.dev/msgpack/v5#example-Decoder.Query).

[customencoder]: https://pkg.go.dev/go.oneofone.dev/msgpack/v5#CustomEncoder
[customdecoder]: https://pkg.go.dev/go.oneofone.dev/msgpack/v5#CustomDecoder
[encoder.setcustomstructtag]:
  https://pkg.go.dev/go.oneofone.dev/msgpack/v5#Encoder.SetCustomStructTag
[decoder.setcustomstructtag]:
  https://pkg.go.dev/go.oneofone.dev/msgpack/v5#Decoder.SetCustomStructTag

## Installation

msgpack supports 2 last Go versions and requires support for
[Go modules](https://github.com/golang/go/wiki/Modules). So make sure to initialize a Go module:

```shell
go mod init github.com/my/repo
```

And then install msgpack/v5 (note _v5_ in the import; omitting it is a popular mistake):

```shell
go get go.oneofone.dev/msgpack/v5
```

## Quickstart

```go
import "go.oneofone.dev/msgpack/v5"

func ExampleMarshal() {
    type Item struct {
        Foo string
    }

    b, err := msgpack.Marshal(&Item{Foo: "bar"})
    if err != nil {
        panic(err)
    }

    var item Item
    err = msgpack.Unmarshal(b, &item)
    if err != nil {
        panic(err)
    }
    fmt.Println(item.Foo)
    // Output: bar
}
```

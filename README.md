zstd-erlang
=====

[![Build Status](https://travis-ci.org/mururu/zstd-erlang.svg?branch=master)](https://travis-ci.org/mururu/zstd-erlang)
[![Hex.pm](https://img.shields.io/hexpm/v/zstd.svg)](https://hex.pm/packages/zstd)

Zstd binding for Erlang/Elixir

http://facebook.github.io/zstd/

The current version uses [v1.0.0](https://github.com/facebook/zstd/releases/tag/v1.0.0)

Usage
-----

```
zstd:compress(Binary).
zstd:compress(Binary, CompressionLevel).
zstd:decompress(Binary).
```

```
1> Compressed = zstd:compress(<<"Hello, World!">>).
<<40,181,47,253,32,13,105,0,0,72,101,108,108,111,44,32,87,
  111,114,108,100,33>>
2> zstd:decompress(Compressed).
<<"Hello, World!">>
```

#### For Elixir

```
iex(1)> compressed = :zstd.compress("Hello, World!")
<<40, 181, 47, 253, 32, 13, 105, 0, 0, 72, 101, 108, 108, 111, 44, 32, 87, 111,
  114, 108, 100, 33>>
iex(2)> :zstd.decompress(compressed)
"Hello, World!"
```

# Buffer

A mutable buffer using ffi for luvit.

```buffer = require('buffer')```

## Class: buffer.Buffer

Main buffer class

## Buffer:inspect()

Inspect a buffer. Returns a string of hexes like <Buffer Hexes>

## Buffer:readUInt8(offset)

Reads unsigned 8 bit int at offset

## Buffer:readInt8(offset)

Read 8 bit int at offset

## Buffer:readUInt16LE(offset)

Read a unsigned 16 bit integer in little endian at offset

## Buffer:readUInt16BE(offset)

Read a unsigned 16 bit integer in big endian at offset

## Buffer:readInt16LE(offset)

Read a signed 16 bit integer in little endian at offset

## Buffer:readInt16BE(offset)

Read a signed 16 bit integer in big endian at offset

## Buffer:readUInt32LE(offset)

Read a unsigned 32 bit integer in little endian at offset

## Buffer:readInt32LE(offset)

Read a signed 32 bit integer in little endian at offset

## Buffer:readInt32BE(offset)

Read a signed 32 bit integer in big endian at offset

## Buffer:toString([i, j])

Stringify the buffer from the ith to the jth position, or the whole thing if i and j arent specified

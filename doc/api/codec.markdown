# Codec

Utilities for working with luvit streams and codecs.

```local codec = require('codec')```

## codec.wrapEmitter(emitter)

Wraps an emitter with coroutines.
Returns read and write functions. 

## codec.wrapStream(socket)

Given a raw uv_stream_t userdara, return coro-friendly read/write functions.

## codec.chain(...)

Allows one to chain coroutines

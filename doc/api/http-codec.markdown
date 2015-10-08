# HTTP Codec

A simple pair of functions for converting between hex and raw strings.  
`local httpCodec = require('http-codec')`

## httpCodec.encoder()

Returns a function. See the source at [http.lua:ServerResponse](https://github.com/luvit/luvit/blob/master/deps/http.lua#L113-L199) for an example.  

## httpCodec.decoder()

Returns a function which takes one argument. See the source at [http.lua](https://github.com/luvit/luvit/blob/master/deps/http.lua#L251-L338) for an example.  

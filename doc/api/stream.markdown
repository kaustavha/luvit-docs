# Stream

A port of node.js's stream module for luvit.

``` local Stream = require('Stream')```

## Class: Stream.Stream

This is the stream core or base.
Extends the emitter class described in Core.

You will most likely not use this class. The only relevant part of this class, the pipe method, is overriden in Readable.

## Class: Stream.ReadableState

Used to hold state by the Readable class

## ReadableState:initialize(options, stream)

Options table:

* HighWaterMark - Defaults to 16, maxes out at 128MB. 128MB limit cannot be overwritten without modifying luvit/deps/stream/stream_readable
* objectMode - If false/nil then the highWaterMark is set to 16 * 1024


## Class: Stream.Readable

Extends Stream.Stream, implements a readable stream interface. 
Uses ReadableState to keep track of self._readableState

## Readable:push(chunk)

Manually shove something into the read buffer. 
This returns true if the highWaterMark has not been hit yet, similar to how Writable.write() returns true if you should write() some more.

## Readable:unshift(chunk)

Unshift should *always* be something directly out of read()

## Readable:read(n)

Reads and returns n chunk bytes

## Readable:_read(n)

Internal method executed by Readable:read. Can be overwritten in child classes. 

## Readable:unpipe(dest)

Removes pipes to dest

## Readable:on(ev, fn)

Triggers a callback `fn` when an event `ev` is triggered. 
E.g.
```
> local child = require('stream').Readable
> child:on('foo', function() print('bar') end)
> child:emit('foo')
'bar'
> child:on('bar', function(data) print(data) end)
> child:emit('bar', 'foo')
'foo'
```

## Readable.addListener

Alias for Readable:on  
You can use Readable:addListener for an implicit self or use Readable.addListener(self, ...)

## Readable:resume()

Resumes a stream

## Readable:pause()

Pauses a stream

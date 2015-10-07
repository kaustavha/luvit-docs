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

## Class: Stream.WriteReq

Used internally within the Writable class.  

## Class: Stream.WritableState

Used internally within the Writable class to hold state.  

## WritableState:initialize(options, stream)

Options table:

* HighWaterMark - Defaults to 16, maxes out at 128MB. 128MB limit cannot be overwritten without modifying luvit/deps/stream/stream_readable
* objectMode - If false/nil then the highWaterMark is set to 16 * 1024

## Class: Stream.Writable

The writable stream class  
Emits `end` when done  

## Writable:initialize(options)

You can modify the writable state options here, or set them.

## Writable:write(chunk, cb)

Manually write a chunk

## Writable:cork()

Kind of like pause

## Writable:uncork()

Kind of like resume

## Class: Stream.Duplex

A Duplex stream is both readable and writable and inherits the functionality and methods of the aforementioned readable and writable classes.  

## Duplex:initialize(options)

These options are passed along to the initializers of the readable and writable streams this class uses.  
Furthermore, we can have the following key values in the options table.

* readable - false/true
* writable - false/true
* allowHalfOpen - false/true

## Class: Stream.Transform

a transform stream is a readable/writable stream where you do
something with the data.  Sometimes it's called a "filter",
but that's not a great name for it, since that implies a thing where
some bits pass through, and others are simply ignored.  (That would
be a valid example of a transform, of course.)

While the output is causally related to the input, it's not a
necessarily symmetric or synchronous transformation.  For example,
a zlib stream might take multiple plain-text writes(), and then
emit a single compressed chunk some time in the future.

Here's how this works:

The Transform stream has all the aspects of the readable and writable
stream classes.  When you write(chunk), that calls _write(chunk,cb)
internally, and returns false if there's a lot of pending writes
buffered up.  When you call read(), that calls _read(n) until
there's enough pending readable data buffered up.

In a transform stream, the written data is placed in a buffer.  When
_read(n) is called, it transforms the queued up data, calling the
buffered _write cb's as it consumes chunks.  If consuming a single
written chunk would result in multiple output chunks, then the first
outputted bit calls the readcb, and subsequent chunks just go into
the read buffer, and will cause it to emit 'readable' if necessary.

This way, back-pressure is actually determined by the reading side,
since _read has to be called to start processing a new chunk.  However,
a pathological inflate type of transform can cause excessive buffering
here.  For example, imagine a stream where every byte of input is
interpreted as an integer from 0-255, and then results in that many
bytes of output.  Writing the 4 bytes {ff,ff,ff,ff} would result in
1kb of data being output.  In this case, you could write a very small
amount of input, and end up with a very large amount of output.  In
such a pathological inflating mechanism, there'd be no way to tell
the system to stop doing the transform.  A single 4MB write could
cause the system to run out of memory.

However, even in such a pathological case, only a single written chunk
would be consumed, and then the rest would wait (un-transformed) until
the results of the previous transformed chunk were consumed.

## Transform:initialize(options)

Extendable initializer for the Transform class. 

## Transform:_transform(chunk, cb)

The internal transform method. You must define this in your child class. 
E.g. Implement a passthrough filter aka a very fancy way to print hello world
```
local Transform = require('stream').Transform
local Transformer = Transform:extend()
function Transformer:initialize()
  Transform.initialize(self, {objectMode = true})
end

function Transformer:_transform(line, cb)
  self:push(line)
  return cb()
end

local transformer = Transformer:new()
transformer:on('data', print)
transformer:write('hello world')
```

## Class: Stream.PassThrough

An extension of the transform stream class with the transform method declared.  
Basically just the most minimal sort of Transform stream. 
Every written chunk gets output as-is.

## Class: Stream.Observable

Observable is a stream that can be observed outside the pipeline. observe() 
returns a new Readable stream that emits all data that passes through this 
stream. Streams created by observe() do not affect back-pressure.

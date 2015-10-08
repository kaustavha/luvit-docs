# Net

Node-style net client and server module for luvit  

`local net = require('net')`

## Class: Socket

### Socket:initialize(options)

The Socket initializer called when an instance is generated with Socket:new()
You can pass in a number to options and the module will try to guess if a handler of type TCP or PIPE is required, or specify a handler
like so: `Socket:new({handle = 'Valid handle type'})`

### Socket:bind(ip, port)

### Socket:address()

### Socket:shutdown(callback)

### Socket:nodelay(enable)

### Socket:keepalive(enable, delay)

### Socket:pause()

### Socket:resume()

### Socket:connect(...)

Works as either  
```
local options = {
  host = ...,
  port = ...
}
connect(options, [cb])
```
or  
```
connect(port, [host, cb])
```

### Socket:destroy(exception[, callback])

### Socket:listen([queueSize])

Default queueSize is 128

### Socket:getsockname()

## Class: Server

### Server:initialize([options,] connectionListener)

### Server:destroy(err, callback)

### Server:listen(port[, ip], callback)

### Server:address()

## net.createConnection(...)

`createConnection(port, host, callback)`  
or
`createConnection({port = ..., host = ..., callback = ...})`

Creates, configures, connects and returns a new Socket instance.

## net.connect(...)

Alias for net.createConnection(...)

## net.createServer(options, connectionListener)

Creates, configures, initializes and returns a new Server instance.

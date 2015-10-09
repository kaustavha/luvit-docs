# HTTP

Node-style http client and server module for luvit

```local http = require('http')```

## Value: http.headerMeta

Provide a nice case insensitive interface to headers.
Pulled from https://github.com/creationix/weblit/blob/master/libs/weblit-app.lua

## Class: http.IncomingMessage

Incoming message class, extends net.Socket.  

### IncomingMessage:initialize(head, socket)

Head is headers. 
Headers declared in this child class, i.e. options expected in the head table:
```
- version - httpVersion
// Server specific
- method
- path - url
// Client specific
- code - statusCode
- reason - statusMessage
```

### IncomingMessage:_read()

Resumes self.socket

## Class: http.ServerResponse

### ServerResponse:setHeader(name, value)

### ServerResponse:getHeader(name)

### ServerResponse:removeHeader(name)

### ServerResponse:flushHeaders()

### ServerResponse:write(chunk, callback)

### ServerResponse:finish(chunk)

### ServerResponse:writeHead(newStatusCode, newHeaders)

## http.handleConnections(socket, onRequest)

## http.createServer(onRequest)

## Class: http.ClientRequest

### ClientRequest.getDefaultUserAgent()

### ClientRequest:flushHeaders()

### ClientRequest:write(data, cb)

### ClientRequest:done(data, cb)

### ClientRequest:setTimeout(msecs, callback)

## http.parseUrl(url)

## http.request(options, onResponse)
 
## http.get(options, onResponse)

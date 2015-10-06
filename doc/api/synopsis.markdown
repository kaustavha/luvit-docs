# Synopsis

<!--type=misc-->

The luvit CLI tool can be used as a scripting platform just like node. This can be used to run lua scripts as standalone servers, clients, or other tools.

This simple web server written in Luvit responds with Hello World for every request.

    local http = require('http')
    
    http.createServer(function (req, res)
      local body = "Hello world\n"
      res:setHeader("Content-Type", "text/plain")
      res:setHeader("Content-Length", #body)
      res:finish(body)
    end):listen(1337, '127.0.0.1')
    
    print('Server running at http://127.0.0.1:1337/')

To run the server, put the code into a file called `example.js` and execute
it with using luvit

    > luvit server.lua
    Server running at http://127.0.0.1:1337/

This script is a standalone HTTP server, there is no need for Apache or Nginx to act as host.
All of the examples in the documentation can be run similarly.

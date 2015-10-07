# Child Process

It is possible to stream data through a child's stdin, stdout, and stderr in a fully non-blocking way.

## childprocess.spawn(command, args, options)

Spawns a command line process.

Since the data coming in is a stream, you may want to pass it through a filter like the luvit line emitter package
to get lines instead. 

    function example()
      local LineEmitter = require('line-emitter').LineEmitter
      local childProcess = require('childprocess')
      local function run(command, args, options)
        local stdout, stderr = LineEmitter:new(), LineEmitter:new()
        local child = childProcess.spawn(command, args, options)
        child.stdout:pipe(stdout)
        child.stderr:pipe(stderr)
        return child, stdout, stderr
      end
    
      local child = run('ls', {'-hal'}, {})
      child:on('data', print)
    end
    
    example()
    
    total 2
    drwxr-xr-x   31 root  wheel   1.1K Aug 21 16:39 .
    drwxr-xr-x   31 root  wheel   1.1K Aug 21 16:39 ..

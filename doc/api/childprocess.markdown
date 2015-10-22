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

Options can have the following k-v pairs:
```
detached = [Boolean]
stdio = [Array]
cwd = [String]
uid = [Number]
gid = [Number]
```

## childprocess.exec(command[, options], callback)

Executes the supplied command and returns data returned in the callback.  
The callback can be either a function or a thread for coroutine style code.  
The command can have arguments e.g. `childprocess.exec('ls -a', print)`.  

Options can have the following k-v pairs:  
```
timeout = [Number]  
maxBuffer = [Integer, default: 4 * 1024]
signal = [String, default: 'SIGTERM'] 
shell = [String, default: 'cmd.exe' or '/bin/sh']
```
Additionally since this function delegates to Spawn, all spawn option k-vs are also valid.   

## childprocess.execFile(file[, args, options, callback])

Similiar to exec but the arguments for the command/file must be supplied as a string to the second parameter.  Also, callback is optional as well here.  

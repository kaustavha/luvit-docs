# FS

Node-style filesystem module for luvit

```local fs = require('fs')```

Uses lib uv under the hood. A lot of these fuctions are very similiar to linux system calls and can be understood by reading the man pages of linux command line commnds with the same names.

The asynchronous form always takes a completion callback as its last argument. The arguments passed to the completion callback depend on the method, but the first argument is always reserved for an exception. If the operation was completed successfully, then the first argument will be null or undefined.

Sync versions of functions usually return true if they succeed or an error if they dont and no data is expected.
Otherwise they return the data on success. 

## fs.close(fileDescriptor, callback)

Close a file. No arguments other than a possible exception are given to the completion callback.

## fs.closeSync(fd)

Synchronous file close

## fs.open(path[, flags, mode], callback)

Asynchronous file open. `flags` can be:

* `'r'` - Open file for reading.
An exception occurs if the file does not exist.

* `'r+'` - Open file for reading and writing.
An exception occurs if the file does not exist.

* `'rs'` - Open file for reading in synchronous mode. Instructs the operating
  system to bypass the local file system cache.

  This is primarily useful for opening files on NFS mounts as it allows you to
  skip the potentially stale local cache. It has a very real impact on I/O
  performance so don't use this flag unless you need it.

  Note that this doesn't turn `fs.open()` into a synchronous blocking call.
  If that's what you want then you should be using `fs.openSync()`

* `'rs+'` - Open file for reading and writing, telling the OS to open it
  synchronously. See notes for `'rs'` about using this with caution.

* `'w'` - Open file for writing.
The file is created (if it does not exist) or truncated (if it exists).

* `'wx'` - Like `'w'` but fails if `path` exists.

* `'w+'` - Open file for reading and writing.
The file is created (if it does not exist) or truncated (if it exists).

* `'wx+'` - Like `'w+'` but fails if `path` exists.

* `'a'` - Open file for appending.
The file is created if it does not exist.

* `'ax'` - Like `'a'` but fails if `path` exists.

* `'a+'` - Open file for reading and appending.
The file is created if it does not exist.

* `'ax+'` - Like `'a+'` but fails if `path` exists.

`mode` sets the file mode (permission and sticky bits), but only if the file was
created. It defaults to `0666`, readable and writeable.

The callback gets two arguments `(err, fd)`.

The exclusive flag `'x'` (`O_EXCL` flag in open(2)) ensures that `path` is newly
created. On POSIX systems, `path` is considered to exist even if it is a symlink
to a non-existent file. The exclusive flag may or may not work with network file
systems.

On Linux, positional writes don't work when the file is opened in append mode.
The kernel ignores the position argument and always appends the data to
the end of the file.

## fs.openSync(path, flags[, mode])

Synchronous version of `fs.open()`. Returns an integer representing the file
descriptor.

## fs.read(fd, [, size, offset], callback)

Read data from the file specified by `fd`.

`offset` is the offset in the buffer to start reading at.

`size` is an integer specifying the number of bytes to read. Defaults to 4096.

The callback is given the three arguments, `(err, bytesRead, buffer)`.

## fs.readSync(fd[, size, offset])

Synchronous file read

## fs.unlink(path, callback)

Asynchronous delete file. No arguments other than a possible exception are given
to the completion callback.

## fs.unlinkSync(path)

Synchronous unlink. Returns `undefined`.

## fs.write(fd[, offset], data, callback)

Writes a data in string `data` to a file `fd` calling a function `callback` with 
err or nil when done. `offset` is the offset in the buffer to start writing at.

## fs.writeSync(fs[, offset,] data)

Synchronous version of the above write function

## fs.mkdir(path[, mode], callback)

Creates a directory with name `path` and returns a callback with err or nil.
Mode is the permissions set on the directory, defaults to octal 0777

## fs.mkdirSync(path, mode)

Sync version of mkdir. 

## fs.mkdtemp(template, callback)

Makes a directory from a template object

## fs.mkdtempSync(template)

Sync version of mkdtemp

## fs.rmdir(path, callback)

It's like `rm -rf` but in luvit!

## fs.rmdirSync(path)

Sync version of rmdir

## fs.readdir(path, callback)

Reads a directory, returning files and folders in it in the callback. First arg of cb is nil or err
This function is not recursive. Use the luvit-walk package for a recursive variant

## fs.readdirSync(path)

Sync version of readdir

## fs.scandir(path, callback)

Similiar to readdir but the callback here gets a function instead of a table containing
the list of files. Every time this function is invoked it returns the name of the file/dir
and the type of the file/dir (either file or directory).

## fs.scandirSync(path)

Simply returns the iterator function retrieved in the async scandirs callback

## fs.exists(path, callback)

Checks if a file exists. Callback is called with true or false and an error or nil in the
first and second args respectively.

## fs.existsSync(path)

Sync version of exists. Returns the args the callback gets in the async version

## fs.stat(path, callback)

```
> fs.stat('/', function(err, stat) print(err) statData = stat end)
uv_fs_t: 0x00ada5c0
> nil
statData
{ mtime = { nsec = 0, sec = 1440200375 },
  atime = { nsec = 0, sec = 1444233226 }, ino = 2, nlink = 31, uid = 0,
  blksize = 4096, ctime = { nsec = 0, sec = 1440200375 }, rdev = 0,
  size = 1122, mode = 16877, type = 'directory',
  birthtime = { nsec = 0, sec = 1428616447 }, flags = 0, gid = 0, gen = 0,
  dev = 16777220, blocks = 0 }
```

## fs.statSync(path)

Sync version of fs.stat. Returns either an error or the stat object
  
## fs.fstat(fd, callback)

Similiar to stat but expects a file descriptor as retrieved from open or read instead of a path

## fs.fstatSync(fd)

Sync fstat

## fs.lstat(path, callback)

lstat() is identical to stat(), except that if path is a symbolic link, then the link itself is stat-ed, not the file that it refers to.

## fs.lstatSync(path)

Sync lstat

## fs.rename(path, newPath, callback)

Renames a file or directory located at the given path to the new path.
The callback is called with either the error or true

## fs.renameSync(path, newPath)

Sync version of rename

## fs.fsync(fd, callback)

Async fsync. No arguments other than a possible exception are given to the completion callback.

fsync() transfers ("flushes") all modified in-core data of (i.e., modified buffer cache pages for) the file referred to by the file descriptor fd to the disk device (or other permanent storage device) so that all changed information can be retrieved even after the system crashed or was rebooted. This includes writing through or flushing a disk cache if present. The call blocks until the device reports that the transfer has completed. It also flushes metadata information associated with the file (see stat(2)).

Calling fsync() does not necessarily ensure that the entry in the directory containing the file has also reached disk. For that an explicit fsync() on a file descriptor for the directory is also needed.

## fs.fsyncSync(fd)

Sync version of fsync

## fs.fdatasync(fd, callback)

fdatasync() is similar to fsync(), but does not flush modified metadata unless that metadata is needed in order to allow a subsequent data retrieval to be correctly handled. For example, changes to st_atime or st_mtime (respectively, time of last access and time of last modification; see stat(2)) do not require flushing because they are not necessary for a subsequent data read to be handled correctly. On the other hand, a change to the file size (st_size, as made by say ftruncate(2)), would require a metadata flush.

The aim of fdatasync() is to reduce disk activity for applications that do not require all metadata to be synchronized with the disk.

## fs.fdatasyncSync(fd)

Sync fdatasync

## fs.ftruncate(fname[, offset], callback)

Shrink or extend the size of each FILE to the specified size

A FILE argument that does not exist is created.

If a FILE is larger than the specified size, the extra data is lost. If a FILE is shorter, it is extended and the extended part (hole) reads as zero bytes.

## fs.ftruncateSync(fname[, offset])

Sync truncate

## fs.sendFile(outFd, inFd, offset, length, callback)

sendfile() copies data between one file descriptor and another. Because this copying is done within the kernel, sendfile() is more efficient than the combination of read(2) and write(2), which would require transferring data to and from user space.

## fs.sendfileSync(outFd, inFd, offset, length)

Sync sendfile

## fs.access(path[, flags], callback)

Tests a user's permissions for the file specified by path. mode is an optional integer that specifies the accessibility checks to be performed. The following constants define the possible values of mode. It is possible to create a mask consisting of the bitwise OR of two or more values.

- fs.F_OK - File is visible to the calling process. This is useful for determining if a file exists, but says nothing about rwx permissions. Default if no mode is specified.
- fs.R_OK - File can be read by the calling process.
- fs.W_OK - File can be written by the calling process.
- fs.X_OK - File can be executed by the calling process. This has no effect on Windows (will behave like fs.F_OK).
- The final argument, callback, is a callback function that is invoked with a possible error argument. If any of the accessibility checks fail, the error argument will be populated. The following example checks if the file /etc/passwd can be read and written by the current process.

## fs.chmod(path, mode, callback)

Asynchronous fchmod(2). No arguments other than a possible exception are given to the completion callback.

## fs.cmodSync(fd, mode)

Sync chmod.

## fs.fchmod(fd, mode, callback)

Asynchronous fchmod(2). No arguments other than a possible exception are given to the completion callback.

## fs.fchmodSync(fd, mode0

Sync fchmod

## fs.utime(path, atime, mtime, callback)

Async utime. Chages file last access and modification times

## fs.utimeSync(path, atime, mtime)

Sync utime

## fs.futime(fd, atime, mtime, callback)

Changes file timestamps

## fs.futimeSync(fd, atime, mtime, callback)

Sync futime

## fs.link(path, newPath, callback)

link() creates a new link (also known as a hard link) to an existing file.
If newpath exists it will not be overwritten.

This new name may be used exactly as the old one for any operation; both names refer to the same file (and so have the same permissions and ownership) and it is impossible to tell which name was the "original".

## fs.linkSync(path, newPath)

Sync link

## fs.symink(path, newPath[, option], callback)

Creates soft link instead of a hard link as in link

## fs.symlinkSync(path, newPath[, options])

Sync symlink

## fs.readlink(path, callback)

Asynchronous readlink(2). The callback gets two arguments (err, linkString).
Prints value of a symbolic link or canonical file name

## fs.readlinkSync(path)

Sync readlink

## fs.chown(path, uid, gid, callback)

Async chown. Changes ownership of a file

## fs.chownSync(path, uid, gid)

Sync chown

## fs.fchown(fd, uid, gid, callback)

Like chown but works with file descriptors

## fs.fchownSync(fd, uid, gid)

Sync fchown

## fs.readFile(path, callback)

Reads a file to a string buffer which is returned as the second argument in the callback. Works with virtual filesystems as well

## fs.readFileSync(path)

Sync readFile

## fs.writeFile(path, data, callback)

Writes a file. 

## fs.writeFileSync(path, data)

Sync writeFile

## fs.appendFile(filename, data[, callback])

Appends data to a file

## fs.appendFileSync(path, data)

Sync version of append file.

## Class: fs.WriteStream

Creates a writeable stream
You can extend the following class methods in your extended instance.

e.g.

```
local path, cb, chunk = 'valid/path', validFunc, 'validString'
local WritableChild = fs.WriteStream:extend()
function WritableChild:_write(data, callback)
  print('Wrote: '..data)
  callback()
end
local writable = WritableChild:new(path, cb)
writable:on('open', function() print('file opened')
writable:write(chunk) -- optional callback
writable:close()
```

## fs.WriteStream:initialize(path, options)

You can set the path to the file and options here. Options is a table with the following key-value pairs

* fd - File descriptor

* flags - 'w' for write. See fs.open for other possible flags

* mode - file mode to write to. Defaults to 438 which is equivalent to octal 0666

* start - Start position

## fs.WriteStream:open(callback)

Callback to fire when the write stream is opened. This callback gets no arguments
An open event is also emitted with the file descriptor when the file is opened

## fs.WriteStream:_write(data, callback)

Internal write utility. Bind the declared `_write` in your inherited class to be called when the file is opened

## fs.WriteStream:close()

Closes or destroys the write stream. Calls self:destroy()

## fs.WriteStream:destroy()

Closes the write stream

## fs.createWriteStream(path, options)

Creates and returns a new write stream, that is an instance of the afore mentioned WriteStream class with the given path and options

## Class: fs.WriteStreamSync

A synchronous version of the WriteStream class. Extends WriteStream

## Class: fs.ReadStream

A parent class for creating readable streams from files
You should extend the following class methods in your extended instance
 
## fs.ReadStream:initialize(path, options)

Initializer for the ReadStream class. 
Options table key values: 
* fd - file descriptor
* mode
* path
* offset
* chunkSize
* length

## fs.ReadStream:open(callback)

Callback to fire when the read stream is opened. This callback gets no arguments
An open event is also emitted with the file descriptor when the file is opened

## fs.ReadStream:_read(n)

Reads a file, n chunk bytes at a time. You can set the n in the init options

## fs.ReadStream:close()

Closes the readstream. 

## fs.ReadStream:destroy(err)

Destroys the readstream. Gets called by close. Emits 'error' with err if theres an error. 

## fs.createReadStream(path, options)

Function which creates and returns a new read stream instance with the set options and path

# Path

This module contains utilities for handling and transforming file paths. 
Almost all these methods perform only string transformations. The file system is not consulted to check whether paths are valid.
Supports both windows and posix.  

Use `require('path')` to use this module. The following methods are provided:

## path.getRoot([filePath])

Gets the filesystems root path. 

## path.getSep()

Gets the filesystems default path seperator

## path.pathEquals(a, b)

Checks if path a is equal to b

## path.normalize(filepath)

Normalize a string path, taking care of '..' and '.' parts.

When multiple slashes are found, they're replaced by a single one; when the path contains a trailing slash, it is preserved. On Windows backslashes are used.

## path.join(...)

Joins a splat of different strings together with the default seperator to form a valid path

## path.resolve([from ...], to)

Works backwards, joining the arguments until it resolves to an absolute path. 
If an absolute path is not resolved, then the current working directory is prepended

E.g.

```
> path.resolve('/foo/bar', '/tmp/file/')
'/tmp/file/'
```
## path.relative(from, to)

Returns the relative path from 'from' to 'to' 
If no relative path can be solved, then 'to' is returned

## path.dirname(filepath)

Return the directory name of a path. Similar to the Unix dirname command.

## path.basename(filepath, expected_ext)

Return the last portion of a path. Similar to the Unix basename command.

## path.extname(filepath)

Return the extension of the path, from the last '.' to end of string in the last portion of the path. If there is no '.' in the last portion of the path or the first character of it is '.', then it returns an empty string. Examples:

## path.isAbsolute(filepath)

Checks if filepath is absolute

## path.isUNC(filepath)

Checks if the path follows Microsofts universal naming convention

## path.isDriveRelative(filepath)

Drive-relative paths are unique to Windows and use the format <letter>:filepath

## path.normalizeSeparators(filepath)

Returns file path with posix seperators

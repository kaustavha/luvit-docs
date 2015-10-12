# JSON

```local json = require('json')```

Alternatively you can use lpeg like so:

```
local json = require('json').use_lpeg()
```

## json.stringify(value [, state])

Serialize a Lua table into a JSON string.

``` lua
local tbl = { username = "Groucho" }
local json_str = json.stringify( tbl )
```


## json.encode(value[, state])

Alias for json.stringify

## json.parse(str [, pos][, nullval][, ...])

Deserialize a JSON string into a Lua table.

``` lua
local json_str = '{ "username": "Groucho" }'
local tbl = json.parse( json_str )
```


## json.decode(str[, pos, nullval, ...])

Alias for json.parse

## Value: json.null

A null property type for JSON encoding.

``` lua
local tbl = { user = "Jane", is_working = json.null }
local json_str = json.stringify( tbl )
```

## json.quotestring(value)

Quotes a string. Based on the regexp "escapable" in https://github.com/douglascrockford/JSON-js


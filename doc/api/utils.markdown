# Utils

Wrapper around pretty-print with extra tools for luvit

`local utils = require('utils')`

Everything in pretty-print is available under the utils namespace as well. 
Additionally utils has the following available functions

## utils.bind(fn, self, ...)

## utils.noop(err)

## utils.adapt(c, fn, ...)

Used heavily within luvit to wrap luv methods and expose them.

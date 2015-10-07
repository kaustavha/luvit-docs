# Core

Core object model for luvit using simple prototypes and inheritance. We support single inheritance for classes.

## core.instanceof(obj, class)

Given an object which inherits from a class, and a class, returns whether the object is an instance of that class.

```
> em = core.Emitter:new()
> core.instanceof(em, core.Emitter)
true
```

## core.Object

The base object class. It provides simple prototypal inheritance and inheritable constructors. 
All other objects inherit from this.

## Object:create()

Creates a new instance of the base object

## Object:new(...)

Creates a new instance and calls `obj:initialize(...)` if it exists.
```
local Rectangle = Object:extend()
function Rectangle:initialize(w, h)
  self.w = w
  self.h = h
end
function Rectangle:getArea()
  return self.w * self.h
end
local rect = Rectangle:new(3, 4)
p(rect:getArea())
```

## Object:extend()

Creates a new sub-class.

```
local Square = Rectangle:extend()
function Square:initialize(w)
  self.w = w
  self.h = h
end
```

## core.Emitter

This class can be used directly whenever an event emitter is needed.
```
local emitter = Emitter:new()
emitter:on('foo', p)
emitter:emit('foo', 1, 2, 3)
```
Also it can easily be sub-classed.
```
local Custom = Emitter:extend()
local c = Custom:new()
c:on('bar', onBar)
```
Unlike EventEmitter in node.js, Emitter class doesn't auto binds `self`
reference. This means, if a callback handler is expecting a `self` reference,
utils.bind() should be used, and the callback handler should have a `self` at
the beginning its parameter list.
```
function some_func(self, a, b, c) end
emitter:on('end', utils.bind(some_func, emitter))
emitter:emit('end', 'a', 'b', 'c')
```

## Emitter:on(name. callback)

Adds an event listener (`callback`) for the named event `name`.

```
em = Emitter:new()
em:on('data', function(data) print(data) end)
```

## Emitter:once(name, callback)

Same as `Emitter:on` except it de-registers itself after the first event.

## Emitter:listenerCount(name)

Returns the count of the listeners bound to an event with the name `name`

## Emitter:emit(name, ...)

Emit a named event to all listeners with optional data arguments

```
> em = Emitter:new()
> em:on('data', function(data) print(data) end)
> em:emit('data', 'foo')
'foo'
```

## Emitter:removeListener(name, callback)

Removes a listener so it no longer catches events

```
> em = Emitter:new()
> em:on('data', function(data) print(data) end)
> em:emit('data', 'foo')
foo
> em:removeListener('data', function() em:emit('data', 'foo') end)
> -- nothing printed
```

## Emitter:removeAllListeners(name)

Removes all listeners. Name is optional and if supplied will make it act like removeListener

## Emitter:listeners(name)

Returns listeners for the event with name `name`

## Emitter:wrap(name)

Utility that binds the named method `self[name]` for use as a callback.  The
first argument (`err`) is re-routed to the "error" event instead.


    local Joystick = Emitter:extend()
    function Joystick:initialize(device)
      self:wrap("onOpen")
      FS.open(device, self.onOpen)
    end
    function Joystick:onOpen(fd)
      -- and so forth
    end
    
## Emitter:propagate(eventName, target)

Propagate the event to another emitter.

## core.Error

This is for code that wants structured error messages.

## Error:initialize(message)

How to handle strings

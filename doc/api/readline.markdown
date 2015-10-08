# Readline

A readline interface for terminals in pure lua.

`local readline = require('readline')`

## Class: readline.History

### History:add(line)

### History:setMaxLength(length)

### History:clean()

### History:load(data)

### History:clean()

### History:dump()

### History:updateLastLine(line)

## Class readline.Editor

### Editor:refreshLine()

### Editor:insertAbove(line)

### Editor:insert(line)

### Editor:moveLeft()

### Editor:getHistory(delta)

### Editor:backspace()

### Editor:delete()

### Editor:swap()

### Editor:deleteLine()

### Editor:deleteEnd()

### Editor:moveHome()

### Editor:moveEnd()

### Editor:deleteWord()

### Editor:jumpLeft()

### Editor:jumpRight()

### Editor:clearScreen()

### Editor:beep()

### Editor:complete()

### Editor:onKey(key)

### Editor:readLine(prompt, callback)

## readline.readLine(prompt[, options], callback)

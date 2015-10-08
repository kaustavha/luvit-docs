# Pretty print

A lua value pretty printer and colorizer for terminals.  

`local prettyPrint = require('pretty-print')`

## prettyPrint.loadColors([index])

Index lets you optionally pick a theme, 16 or 256. 

## Value: prettyPrint.theme

Table of keys and values of the available themes

## prettyPrint.print(...)

Works like the default lua print function. We also override the default lua print function

## prettyPrint.prettyPrint(...)

## prettyPrint.dump(value, recurse, nocolor)

## prettyPrint.color(colorName)

## prettyPrint.colorize(colorName, string, resetName)

## prettyPrint.strip(str)

## Userdata Value: prettyPrint.stdin

## Userdata Value: prettyPrint.stdout

## Userdata Value: prettyPrint.stderr


# Luvit Documentation

Much needed docs for [Luvit](https://luvit.io/). 
The build system and scaffolding is straight up ripped out of node.js.  
Therefore you will need [node.js](https://nodejs.org/) installed to make these docs.  

- Clean generated documentation -> `make docclean`
- Generate documentation -> `make doc`
- Open docs in Chrome on OSX or Linux -> `make docopen`

Simply running `make` will run the above tasks in the specified order.

# Todo

These docs are a skeleton at the moment. My goal is to begin by at least indexing the functions available to Luvit users to save a little time reading through the source code.  
PRs, suggestions, issues, bug/mistake reports are very welcome.

- Add more code examples (There's some examples in the luvit repo under examples)
- Expand on method/class/func defintions and their purposes
- Change code rendering from js to lua
- Rewrite doc generation pipe in lua/luvit?

# URL

Node-style url codec for luvit

## url.parse(url[, parseQueryString])

Takes a url string, returns an object
Optional second argument of type bool. Pass in true if you'd like to pass the query part of the url through the
querystring modules parse function.

```
url = require('url')
url.parse('https://github.com/luvit/luvit/blob/master/deps/url.lua')
```
Returns
```
{ host = 'github.com', hostname = 'github.com', href = 'https://github.com/luvit/luvit/blob/master/deps/url.lua', protocol = 'https',
  pathname = '/luvit/luvit/blob/master/deps/url.lua', path = '/luvit/luvit/blob/master/deps/url.lua' }
```

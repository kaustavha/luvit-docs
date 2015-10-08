# DNS

Node-style dns module for luvit

```local dns = require('dns')```

## dns.query(servers, name, dnsclass, qtype, callback)

## dns.resolve4(name, callback)

## dns.resolve6(name, callback)

## dns.resolveSrv(name, callback)

## dns.resolveMx(name, callback)

## dns.resolveNs(name, callback)

## dns.resolveTxt(name, callback)

## dns.setServers(servers)

## dns.setTimeout(timeout)

## dns.setDefaultTimeout()

Sets the timeout to the default timeout of 2 seconds

## dns.setDefaultServers()

Sets the list of servers to the default list 

```
{
  {
    ['host'] = '8.8.8.8',
    ['port'] = 53,
    ['tcp'] = false
  },
  {
    ['host'] = '8.8.4.4',
    ['port'] = 53,
    ['tcp'] = false
  },
}
```

## dns.loadResolver(options)

Options is a table with key file. E,g
```
{file = '/etc/resolv.conf'}
```

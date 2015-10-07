# DATAGRAM | UDP

Node-style udp module for luvit

```local dgram = require('dgram')```

## dgram.createSocket(type, callback)

Creates a new datagram socket
Callback is triggered every time the 'message' event gets emitted

## Class: dgram.Socket

Socket extends Emitter and inherits all the events thereof.
The dgram Socket class encapsulates the datagram functionality. It should be created via dgram.createSocket(...)  

## Socket:recvStart()

Start receiving on socket

## Socket:recvStop()

Stop listening on socket

## Socket:setTimeout(msecs, callback)

Sets a socket timeout 

## Socket:send(data, port, host, callback)

Sends data down the udp socket

## Socket:bind(port, host, options)

Starts listening on the specified port and host. 

## Socket:close(callback)

Closes a socket instance and fires the callback after cleanup

## Socket:address()

Returns an object containing the address information for a socket. For UDP sockets, this object will contain address , family and port.

## Socket:setBroadcast(status)

* status - Boolean
Sets or clears the SO_BROADCAST socket option. When this option is set, UDP packets may be sent to a local interface's broadcast address.

## Socket:setMembership(multicastAddress[, multicastInterface], op)

Sets membership status for a multicast group. Op can be 'join' or 'leave'.

## Socket:addMembership(multicastAddress[, interfaceAddress])

- multicastAddress String
- multicastInterface String, Optional
Tells the kernel to join a multicast group with IP_ADD_MEMBERSHIP socket option.

If multicastInterface is not specified, the OS will try to add membership to all valid interfaces.

## Socket:dropMembership(multicastAddress[, interfaceAddress])

- multicastAddress String
- multicastInterface String, Optional
Opposite of addMembership - tells the kernel to leave a multicast group with IP_DROP_MEMBERSHIP socket option. This is automatically called by the kernel when the socket is closed or process terminates, so most apps will never need to call this.

If multicastInterface is not specified, the OS will try to drop membership to all valid interfaces.

## Socket:setTTL(ttl)

- ttl Integer
Sets the IP_TTL socket option. TTL stands for "Time to Live," but in this context it specifies the number of IP hops that a packet is allowed to go through. Each router or gateway that forwards a packet decrements the TTL. If the TTL is decremented to 0 by a router, it will not be forwarded. Changing TTL values is typically done for network probes or when multicasting.

The argument to setTTL() is a number of hops between 1 and 255. The default on most systems is 64.


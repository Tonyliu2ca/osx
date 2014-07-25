#!/bin/sh
# network tuning

# don't delay sending acks to syns
/usr/sbin/sysctl -w net.inet.tcp.delayed_ack=0

exit 0

# increase the size of tcp & udp windows
/usr/sbin/sysctl -w net.inet.ip.portrange.last=65535
/usr/sbin/sysctl -w net.inet.tcp.sendspace=65535
/usr/sbin/sysctl -w net.inet.tcp.recvspace=65535
/usr/sbin/sysctl -w net.inet.udp.recvspace=65535
/usr/sbin/sysctl -w net.inet.udp.maxdgram=57344
/usr/sbin/sysctl -w net.inet.tcp.rfc1323=1
/usr/sbin/sysctl -w net.local.stream.recvspace=65535
/usr/sbin/sysctl -w net.local.stream.sendspace=65535

# set buffer size for sockets
/usr/sbin/sysctl -w kern.ipc.maxsockbuf=2097152

exit 0
config setup

conn L2TP-PSK
    authby=secret
    pfs=no
    auto=add
    rekey=no
    left=%defaultroute
    type=transport
    leftprotoport=17/1701
    rightprotoport=17/1701
    dpddelay=15
    dpdtimeout=30
    dpdaction=clear
    # optionally specify specific IKEv1 encryption/authentication handshake supported by your VPN server e.g:
    ike=3des-sha1;modp1024
    # set this to the ip address of your vpn server:
    right=${l2tp_ipv4}

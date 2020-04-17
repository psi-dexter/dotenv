
[lac ${name}]
; set this to the ip address of your vpn server
lns = ${l2tp_ipv4}
ppp debug = yes
pppoptfile = /etc/ppp/options.l2tpd.client
length bit = yes

firewall-cmd --permanent --zone=public --add-port=35053/udp
firewall-cmd --permanent --zone=public --add-masquerade
firewall-cmd --reload
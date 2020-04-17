# Create a wireguard interface (device) named `wg1`. The kernel knows what a 
# wireguard interface is as we've already installed the kernel module
ip link add dev ${bridge_name} type wireguard

# Point our new wireguard interface at the VPN server and allocate addresses
# for the interface
wg setconf ${bridge_name} /etc/wireguard/${bridge_name}.conf
ip address add ${subnet} dev ${bridge_name}

# Start the interface and add the VPN server as our DNS nameserver. This is so
# our VPN will resolve hostnames like httpbin.org or google.com.
ip link set up dev ${bridge_name}
printf 'nameserver %s\n' '${nameserver}' | resolvconf -a tun.${bridge_name} -m 0 -x

# rp_filter is reverse path filtering. By default it will ensure that the
# source of the received packet belongs to the receiving interface. While a nice
# default, it will block data for our VPN client. By switching it to '2' we only
# drop the packet if it is not routable through any of the defined interfaced.
sysctl -w net.ipv4.conf.all.rp_filter=2
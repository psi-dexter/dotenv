dnf install epel-release -y
dnf install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm -y
dnf clean all; dnf update -y;
dnf install akmod-wireguard wireguard -y
akmods --force
modprobe wireguard && lsmod | grep wireguard
PARTITIONS=ada0
DISTRIBUTIONS="base.txz kernel.txz games.txz lib32.txz"

#!/bin/sh
cat >> /etc/rc.conf <<EOF
ifconfig_em0="DHCP"
sshd_enable="YES"
# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
dumpdev="AUTO"
EOF

pw usermod root -h 0 <<EOF
vagrant
EOF

pkg_add -r bash sudo
sed -e 's/^# \(%wheel ALL=(ALL) ALL\)$/&/' -i .bak /usr/local/etc/sudoers

adduser -f <<EOF
vagrant::::::vagrant::bash:vagrant
EOF
pw usermod vagrant -G wheel

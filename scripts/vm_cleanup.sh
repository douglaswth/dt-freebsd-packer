#!/bin/sh

rm -fv /var/db/dhclient.leases.*
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

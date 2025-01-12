#!/bin/bash

#Add main samba user to start samba process
groupadd -g $GID smbgroup && useradd -g smbgroup -M -u $UID smbuser
echo "Add group smbgroup with gid: $GID"
echo "Add user smbuser with id: $UID"

#Add samba user
useradd -M $USER && (echo "$PASS"; echo "$PASS") | smbpasswd -s -a $USER

#Add share config
echo "[share]" >> /etc/samba/smb.conf
echo "path = \"/share\"" >> /etc/samba/smb.conf
echo "read only = no" >> /etc/samba/smb.conf
echo "valid users = $USER" >> /etc/samba/smb.conf

echo "Cat smb.conf file:"
cat /etc/samba/smb.conf

#Update permissions
chown -R smbuser /share

echo "Start samba process..."
exec ionice -c 3 smbd -F --configfile=/etc/samba/smb.conf --no-process-group </dev/null

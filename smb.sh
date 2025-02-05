#!/bin/bash

# Ensure shared group and user exist
groupadd -f -g $GID smbgroup
useradd -M -g smbgroup -u $UID smbuser 2>/dev/null

# Add or update Samba user
if id "$USER" &>/dev/null; then
    # User already exists, update password
    (echo "$PASS"; echo "$PASS") | smbpasswd -s -a "$USER"
else
    # Create user and add to Samba
    useradd -M "$USER"
    (echo "$PASS"; echo "$PASS") | smbpasswd -s -a "$USER"
fi

# Prepare Samba configuration
cat > /etc/samba/smb.conf << EOL
[global]
workgroup = WORKGROUP
security = user
create mask = 0664
directory mask = 0775
force create mode = 0664
force directory mode = 0775
force user = smbuser
force group = smbgroup
load printers = no
printing = bsd
printcap name = /dev/null
disable spoolss = yes

[share]
path = /share
browseable = yes
read only = no
valid users = $USER
write list = $USER
create mask = 0644
directory mask = 0755
EOL

# Update permissions
mkdir -p /share
chown -R smbuser:smbgroup /share
chmod 775 /share

echo "Samba configuration:"
cat /etc/samba/smb.conf

echo "Starting Samba process..."
exec ionice -c 3 smbd -F --configfile=/etc/samba/smb.conf --no-process-group </dev/null
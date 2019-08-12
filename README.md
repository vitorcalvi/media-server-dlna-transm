# Media Server (Samba + Dlna + Transmission)
Media server contains 3 containers:

- Samba
- Dlna
- Transmission

#### Volumes
- One data volume. 
- One system transmission data volume.

#### Arch
- docker base image: arm64v8/debian:stretch
- so device arch is arm64v8 (or arm64 or aarch64)

## How to install?
1.Clone or download repo:
```
git clone https://github.com/msergei/media-server.git
git cd media-server
```
2.If your want, you can set new login and pass (please see 'user.env.example'):
```
echo 'USER=MY_LOGIN' > user.env
echo 'PASS=MY_PASS' >> user.env
```
3.Start docker-compose:
```
chmod +x rebuild.sh
bash rebuild.sh
```

## How to use?

- You can add torrent files at transmission web page:
```
http://IP_MACHINE:9091/transmission/web/
```
- You can add .torrent file to Samba server, or work with any files:
```
smb://IP_MACHINE/share
```
You must use user and password from 'user.env' if you created it or standard credentials from 'user.env.example':
```
user
pass
```
- You can use special Dlna device or player (VLC for example).
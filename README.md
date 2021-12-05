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
- You need to install docker and docker-compose. Please use official manuals.

- Clone or download repo:
```
git clone https://github.com/msergei/media-server.git
cd media-server
```
- If your want, you can set new login and pass (please see 'user.env.example'):
```
echo 'USER=MY_LOGIN' > user.env
echo 'PASS=MY_PASS' >> user.env
```
- Copy your arch file to .env, for example:
```
cp amd64.env .env
```

- Start docker-compose project:
```
docker-compose up -d
```

- Open Emby server to configure it:
```
http://IP_MACHINE:8096/
```

## How to use?

- You can open browser link Emby server:
```
http://IP_MACHINE:8096/
```
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

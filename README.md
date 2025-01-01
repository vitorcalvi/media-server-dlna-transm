# Media Server (Samba + Dlna + Transmission + JellyFin)
Media server contains 4 containers:

- Samba
- Dlna
- Transmission
- JellyFin

#### Tested arch
- arm64

## How to install?
- You need to install docker and docker-compose. Please use official manuals.

- Clone or download repo:
```
git clone https://github.com/msergei/media-server.git
cd media-server
```
- Copy env file and setup your credentials (please see 'example.env'):
```
cp example.env .env
```
- If you want MiniDlna or JellyFin (contains own Dlna serverice) copy override.example file:
```
cp docker-compose.override.example.yml docker-compose.override.yml
```

- Start docker-compose project:
```
docker-compose up -d
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

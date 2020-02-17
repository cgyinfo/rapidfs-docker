# CGYINFO: RapidFS Docker Image

## Statement
rapidfs docker image based ubuntu 18.04

## Usage

```
docker run -d --name rapidfs -v /d/RES/rapidfs/certs:/etc/rapidfs -v /d/RES/rapidfs/data:/var/lib/rapidfs -v /d/RES/rapidfs/logs:/var/log/rapidfs -p 6379:6379 cgyinfo/rapidfs
```

The image applys three VOLUMES be mounted by container:
/etc/rapidfs : ssl certificate files (server.crt and server.key)
/var/lib/rapidfs : rapidfs data storage
/var/log/rapidfs : rapidfs server log file

## Epilogue

![LOGO](https://www.cgyinfo.com/logo.png)

Please refer to the official website for details: [https://www.cgyinfo.com](https://www.cgyinfo.com)

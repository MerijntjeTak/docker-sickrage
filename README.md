# docker sickrage

This is a Dockerfile to set up "SickRage" - (https://sickrage.github.io/)

## Quick start
docker run --restart=always -d -h *your_host_name* -v /*your_config_location*:/config  -v /*your_videos_location*:/data -p 8081:8081 sickrage

## Development
Build from docker file
```
git clone git@github.com:merijntjetak/docker-sickrage.git
cd docker-sickrage
docker build -t sickrage .
```

## Optional features
### Run as specific user
Specify the environment variables PUID and GUID (use `-e` with `docker run`), eg:
```
docker run --restart=always -d -h *your_host_name* -v /*your_config_location*:/config  -v /*your_videos_location*:/data -e "PUID=2001" -e "GUID=2001" -p 8081:8081 sickrage
```

### Set time zone
Mount the `/etc/localtime` file into the container, eg:
```
docker run --restart=always -d -h *your_host_name* -v /*your_config_location*:/config  -v /*your_videos_location*:/data -v /etc/localtime:/etc/localtime:ro -p 8081:8081 sickrage
```

Based on Tim Haak's implementation (https://github.com/timhaak/docker-sickrage)

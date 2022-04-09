#! /bin/bash
docker stop "motioneye"
docker rm "motioneye"

mkdir ~/motioneye
mkdir ~/motioneye/config
mkdir ~/motioneye/videos

docker run -dit \
  --name "motioneye" \
  -p 8765:8765 \
  -v /etc/localtime:/etc/localtime:ro \
  -v ~/motioneye/config:/etc/motioneye \
  -v ~/motioneye/videos:/var/lib/motioneye \
  "ccrisan/motioneye"
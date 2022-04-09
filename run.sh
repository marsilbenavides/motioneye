#! /bin/bash
docker stop "motioneye"
docker rm "motioneye"
docker rmi "motioneye-img"

mkdir -p ~/motioneye
mkdir -p ~/motioneye/config
mkdir -p ~/motioneye/videos

docker build . \
  --no-cache \
  --network host \
  --build-arg="RUN_UID=$(id -u ${RUN_USER})" \
  --build-arg="RUN_GID=$(id -g ${RUN_USER})" \
  -t "motioneye-img" \
  -f extra/Dockerfile .

docker run -dit \
  --name "motioneye" \
  -p 8765:8765 \
  -v /etc/localtime:/etc/localtime:ro \
  -v ~/motioneye/config:/etc/motioneye \
  -v ~/motioneye/videos:/var/lib/motioneye \
  "motioneye-img"

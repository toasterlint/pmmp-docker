# pmmp-docker

Docker image to run PMMP with DevTools plugin installed.  Run via:

docker run \
--name pmmp \
-d \
-p 19132:19132 \
-p 19132:19132/udp \
-v /your/local/dir:/opt/pmmp \
toasterlint/pmmp-docker:latest

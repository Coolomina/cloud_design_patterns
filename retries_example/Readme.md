# Retries Example
## Docker Commands
### Docker network
```bash
docker network create hola
```
### Pumba
```bash
docker run --network=network1 -it --rm -v /var/run/docker.sock:/var/run/docker.sock gaiaadm/pumba  netem --tc-image gaiadocker/iproute2  --pull-image --duration 5m  loss --percent 40 nginx
```
### Nginx
```bash
docker run --network=network1 --name=nginx --rm nginx
```
### Debian
```bash
docker run --rm --network=network1 --name=debian -ti debian:buster-slim  /bin/bash
```
### Retries
```bash
docker run --network=hola --name=retries_example --rm retries_example 
```
### Destroy
```bash
docker kill nginx debian retries_example
docker network destroy network1
```
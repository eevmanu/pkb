# Docker

## Images

```shell
# build a new image from a dockerfile
docker build {{ /path/to/dockerfile }}

# build a new image with a name, using actual directory as context for working directory
docker build -t {{ image name }} .

# build an image without using previous intermediate cached images
docker build -t {{ image name }} --no-cache .

# manage images
docker image

# list images
docker image ls
docker images

# list all images (including intermediate ones)
docker images -a

# list all images (only show numeric IDs)
docker images -a -q

# sort output by first column
docker images | sort -k 1
```


## Containers

```shell
# list containers
docker ps

# list all containers (including not running ones)
docker ps -a

# list all containers (including file sizes)
docker ps -s
```

### Running containers

- [docker run reference](https://docs.docker.com/engine/reference/run/)
- [docker run commandline](https://docs.docker.com/engine/reference/commandline/run/)

```shell
# run a command inside new container based on image
docker run {{ name of base image }} {{ command to execute }}

# open bash shell inside new container, using {{ image }} as base image
# -i, --interactive     Keep STDIN open even if not attached
# -t, --tty             Allocate a pseudo-TTY
docker run \
    -it \
        {{ image }} \
            /path/to/bash

# open bash shell inside new container, using {{ image }} as base image and destroy container when exit
# --rm                  Automatically remove the container when it exits
docker run \
    -it \
    --rm \
        {{ image }} \
            /path/to/bash

# run a new container in background
# -d, --detach          Run container in background and print container ID
docker run \
    -d \
        {{ image }} \
            {{ command to execute }}

# run a command in a new container, assign a name, from a specific images and a port mapping
# --name string         Assign a name to the container
# -p, --publish list    Publish a container's port(s) to the host
docker run \
    -d \
    --name={{ container name }} \
    -p {{ port mapping }} \
        {{ image name }} \
            {{ command to execue}}
```

### Manage containers

```shell
# start a container that is already created
docker start {{ container name or id }}

# stop a running container
docker stop {{ container name or id }}

# run a specific command in a running container
#   -t, --tty                  Allocate a pseudo-TTY
#   -i, --interactive          Keep STDIN open even if not attached
docker exec \
    -ti \
        {{ container name or id }} \
            {{ command to execute }}
```

### Logging

```shell
# Fetch the logs of a container
docker logs {{ container name or id }}

# Clean container logs
echo "" > $(docker inspect --format='{{.LogPath}}' {{ container name or id }})
# e.g.
echo "" > $(docker inspect --format='{{.LogPath}}' ubuntu)
```

### Metrics

- [Runtime metrics](https://docs.docker.com/config/containers/runmetrics/)
- [docker stats](https://docs.docker.com/engine/reference/commandline/stats/)

```shell
# showing container stats (including names)
docker stats $(docker ps --format={{.Names}})
```


### [Prune unused docker objetcs](https://docs.docker.com/config/pruning/)

- Images

```shell
# cleans up dangling images. A dangling image is one that is not tagged and is not referenced by any container
docker image prune -a

# remove all images which are not used by existing containers
docker image prune -a

# without permission to continue (prompted)
docker image prune -a --force
docker image prune -a -f
```

- Containers

```shell
docker container prune
```

- Volumes

```shell
# list of images when running `docker volume prune`
docker volume ls -qf dangling=true

docker volume prune
```

- Networks

```shell
docker network prune
```

- Everything

```shell
docker system prune

# Prune volumes
docker system prune --volumes

# Do not prompt for confirmation
docker system prune --force

# Remove all unused images not just dangling ones
docker system prune --all
```

- Workarounds: Force clean

[orphaned diffs #22207](https://github.com/moby/moby/issues/22207)

```shell
sudo ls -la /var/lib/docker/aufs/diff/ | grep removing
sudo rm -rf /var/lib/docker/aufs/diff/*-removing
```

- Old style

[How To Remove Docker Images, Containers, and Volumes](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)


```shell
# delete containers
docker rm $(docker ps -a -q -f status=exited)

# delete images
docker rmi $(docker images -a -q -f dangling=true)
docker rmi -f $(docker images -a | grep "<none>" | awk ' {print $3} ')

# delete volumes
docker volume rm $(docker volume ls -q -f dangling=true)
```

### Persist data

- [Manage data in Docker](https://docs.docker.com/storage/)

### Extras

```shell
# show history of docker image
docker history {{ image id }}

# --no-trunc        Don't truncate output
# --format string   Pretty-print images using a Go template
docker history \
    --no-trunc \
    --format '{{.Size}}\t{{.CreatedBy}}' \
        {{ image id }}
# dive - A tool for exploring each layer in a docker image
# https://github.com/wagoodman/dive

# list images ordered by size
docker image ls \
    --format '{{.Size}}\t\t\t{{.Repository}}:{{.Tag}}\t\t\t{{.ID}}' \
    | sort -hr | column -t

# df                Show docker disk usage
# -v, --verbose     Show detailed information on space usage
docker system df -v

# events    Get real time events from the server
docker system events

# info      Display system-wide information
docker system info

# ls        List volumes
docker volume ls

# list volumes attached to a specific container
docker inspect \
    -f '{{ .Mounts }}' \
        {{ container name or id }}

# list container ips
# https://stackoverflow.com/a/20686101/3889948
# {{range pipeline}} T1 {{end}}
#     The value of the pipeline must be an array, slice, map, or channel.
#     If the value of the pipeline has length zero, nothing is output;
#     otherwise, dot is set to the successive elements of the array,
#     slice, or map and T1 is executed. If the value is a map and the
#     keys are of basic type with a defined order, the elements will be
#     visited in sorted key order.
docker inspect \
    -f '{{range .NetworkSettings.Networks}}{{ .IPAddress }}{{end}}' \
        {{ container name or id }}

# Running a container using "postgres" image and passing path to data
#   -v, --volume list                    Bind mount a volume
docker run \
    --name={{ container name }} \
    -v {{ /my/path/to/postgres/db/data }}:/var/lib/postgresql/data \
    -d \
        postgres
```

## Docker Compose

- Usage

```shell
#   -f, --file FILE             Specify an alternate compose file
#                               (default: docker-compose.yml)
docker-compose \
    -f /path/to/docker/compose/file \
    [options] \
        [COMMAND] \
        [ARGS...]
```

- Building images

```shell
# building containers from services declared in docker compose file (in working directory)
docker-compose build

# building containers related to {{ service name }}
docker-compose build {{ service name }}

# building containers related to {{ service name }} without using previous intermediate images as caching step
docker-compose build {{ service name }} --no-cache
```

- Create and start containers

```shell
# up            Create and start containers
docker-compose up

# -d, --detach  Detached mode: Run containers in the background,
#               print new container names. Incompatible with
#               --abort-on-container-exit.
docker-compose up -d

# Start all services from docker compose file
docker-compose start

# Start all containers related to service {{ service name }} on docker compose file
docker-compose start {{ service name }}

# Run "shell bash" on a container, using base image from {{ service name }}
# run                Run a one-off command
docker-compose run \
    {{ service name }} \
        /path/to/bash

```

- List containers

```shell
docker-compose ps
```

- Logging

```shell
# view output (stdout) from containers (declared through services from docker compose file)
docker-compose logs
# view output logs from specific {{ service name }}
docker-compose logs {{ service name }}
# -f, --follow        Follow log output.
docker-compose logs -f
```

- Stop and delete containers

```shell
# remove all stopped service containers
docker-compose rm

# remove all stopped service containers from service {{ service name }}
docker-compose rm {{ service name }}

# remove all stopped service containers without asking to confirm approval
docker-compose rm -f

# stop all running containers without removing them from services declared in docker compose file
docker-compose stop

# stop all running containers without removing them from service {{ service name }}
docker-compose stop {{ service name }}

# stop containers and remove them
# docker compose file should be in working directory
docker-compose stop && docker-compose rm -f
```

- Scaling (not orchestration)

```shell
# Scale containers from service {{ service name }} to 5 and restart all containers, forcing re creation
docker-compose scale \
    {{ service name }}=5 \
    && \
docker-compose up \
    --force-recreate \
    -d
```

## Resources

- [Docker Engine - Get Started](https://docs.docker.com/get-started/overview/#docker-engine)
    - [Docker Engine overview](https://docs.docker.com/engine/)
    - [docker cli](https://docs.docker.com/engine/reference/commandline/cli/)
    - [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
    - [Release notes @ Docker](https://docs.docker.com/engine/release-notes/)
    - [Release notes @ Github](https://github.com/moby/moby/releases)

- [Docker architecture](https://docs.docker.com/get-started/overview/#docker-architecture)

- [Docker objects](https://docs.docker.com/get-started/overview/#docker-objects)

- [Docker compose](https://docs.docker.com/compose/)
    - [Overview of docker-compose CLI](https://docs.docker.com/compose/reference/overview/)
    - [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/)
    - [Environment variables in Compose](https://docs.docker.com/compose/environment-variables/)
    - [Share Compose configurations between files and projects](https://docs.docker.com/compose/extends/)
    - [Release notes @ Docker](https://docs.docker.com/compose/release-notes/)
    - [Release notes @ Github](https://github.com/docker/compose/releases)

- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Post-installation steps for Linux](https://docs.docker.com/engine/install/linux-postinstall/)

- [Educational resources @ Docker](https://docs.docker.com/get-started/resources/)
    - [Play with Docker](https://labs.play-with-docker.com/)

- [Docker development best practices](https://docs.docker.com/develop/dev-best-practices/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Use multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)

- [Networking overview](https://docs.docker.com/network/)

- [Storage overview](https://docs.docker.com/storage/)

- Github
    - [docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet)
    - [awesome-docker](https://github.com/veggiemonk/awesome-docker)
    - [docker_practice](https://github.com/yeasy/docker_practice)
    - [docker-bench-security](https://github.com/docker/docker-bench-security) - script that checks for dozens of common best-practices around deploying Docker containers in production.
    - [docker-slim](https://github.com/docker-slim/docker-slim) - DockerSlim (docker-slim): Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)
    - [ctop](https://github.com/bcicen/ctop) - Top-like interface for container metrics
    - [dockerfiles](https://github.com/jessfraz/dockerfiles) - Various Dockerfiles I use on the desktop and on servers.
    - [distroless](https://github.com/GoogleContainerTools/distroless) - Language focused docker images, minus the operating system.
    - [goreleaser](https://github.com/goreleaser/goreleaser) - Deliver Go binaries as fast and easily as possible
    - [supercronic](https://github.com/aptible/supercronic) - Cron for containers
    - [tini](https://github.com/krallin/tini) - A tiny but valid `init` for containers
    - [scope](https://github.com/weaveworks/scope) - Monitoring, visualisation & management for Docker & Kubernetes


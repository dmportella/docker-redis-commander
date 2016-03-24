# Redis Commander in Docker

This is a simple docker setup for running a redis instance in conjuction with the popular free redis admin interface [Redis Commander](https://github.com/joeferner/redis-commander).

## DOCKERHUB

The official **DockerHub** repository for this project is at: [https://hub.docker.com/r/dmportella/redis-commander/](https://hub.docker.com/r/dmportella/redis-commander/)

[![dockeri.co](http://dockeri.co/image/dmportella/redis-commander)](https://hub.docker.com/r/dmportella/redis-commander/)

# Running this solution

This quite simple to run all commands are detailed below.

1. Clone this repository anywhere in your system.

## Redis

Firstly this setup uses a default and the official setup of redis from docker hub to install redis with a custom setup please visit redis web site.

1. Pull the redis image. 

> $ `docker pull redis`

2. Run the newly installed image. 

> $ `docker run --name redis -p "6379:6379" -d redis:latest`

## Commander

1. Build the redis commander dockerfile this command will create an image with the name commander and tag latest. 

> $ `docker build -t commander:latest .`

2. Run the docker instance from the create image this command will create an container with the name commander linked the redis container and it will expose the application on 127.0.0.1:8080. 

> $ `docker run --name commander --link redis:redis -p 127.0.0.1:8080:8080 -d commander:latest`

## Addition helpful commands

see below a list of useful commands.

### Bash into the container

> $ `docker exec -it commander bash`

### Stop and delete the container and image

> $ `docker stop commander && docker rm commander && docker rmi commander`

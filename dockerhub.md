# Redis Commander in Docker

This is a simple docker setup for running a redis instance in conjuction with the popular free redis admin interface [Redis Commander](https://github.com/joeferner/redis-commander).

Repository at: [https://github.com/dmportella/docker-redis-commander](https://github.com/dmportella/docker-redis-commander)

# Running this solution

This quite simple to run all commands are detailed below.

1. Clone this repository anywhere in your system.

## Redis

Firstly this setup uses a default and the official setup of redis from docker hub to install redis with a custom setup please visit redis web site.

1. Pull the redis image. 

RUN: `docker pull redis`

2. Run the newly installed image. 

RUN: `docker run --name redis -p "6379:6379" -d redis:latest`

## Commander

1. Pull the docker commander image.

RUN: `docker pull dmportella/redis-commander`

2. Run the docker instance from the create image this command will create an container with the name commander linked the redis container and it will expose the application on 127.0.0.1:8080. 

RUN: `docker run --name commander --link redis:redis -p 127.0.0.1:8080:8080 -d dmportella/redis-commander:latest`

## Credentials

URL: http://localhost:8080
User name: `guest`
Password: `guest`

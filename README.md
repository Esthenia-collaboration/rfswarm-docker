# rfswarm-docker

### Description
Set of docker images allowing you to launch rfswarm manager and
rfswarm agents in docker containers.

## Quickstart
### Run the app
Pull image from github registry
````bash
docker pull ghcr.io/esthenia-collaboration/rfswarm-base-image:latest
````
Run container with the default arguments
````bash
docker run --rm --name rfswarm-base-container ghcr.io/esthenia-collaboration/rfswarm-base-image:latest
````
Or run container with the custom arguments
````bash
docker run --rm --name rfswarm-base-container ghcr.io/esthenia-collaboration/rfswarm-base-image:latest -m http://manager:8139
````
You can use all argument of classic rfswarm agent

## Available agent images
* ### Basic agent
* ### Agent with ssh librqry
* ### Selenium library with Chrome
* ### Selenium library with FireFox

## Available manager images
* ### Basic manager


## Contribution And Reviews


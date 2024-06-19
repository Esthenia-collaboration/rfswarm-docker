# rfswarm-docker

This is the first basic version of the agent docker container

## Run the app
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

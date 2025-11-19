# syntax=docker/dockerfile:1

ARG DOCKER_REGISTRY="ghcr.io"
ARG DOCKER_IMAGE="/esthenia-collaboration/rfswarm-agent-base"
ARG DOCKER_IMAGE_VERSION="latest"
FROM ${DOCKER_REGISTRY}${DOCKER_IMAGE}:${DOCKER_IMAGE_VERSION}
# FROM base-image:latest AS base
# FROM base AS ssh

#  Install all the requirements using pip
USER root
RUN pip install --upgrade pip \
    && pip install robotframework-sshlibrary

USER rfagent

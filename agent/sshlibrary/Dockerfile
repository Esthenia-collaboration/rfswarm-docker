# syntax=docker/dockerfile:1

FROM ghcr.io/esthenia-collaboration/rfswarm-agent-base:latest
# FROM base-image:latest AS base
# FROM base AS ssh

#  Install all the requirements using pip
USER root
RUN pip install --upgrade pip \
    && pip install robotframework-sshlibrary

USER rfagent

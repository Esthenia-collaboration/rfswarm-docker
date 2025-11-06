# syntax=docker/dockerfile:1

FROM ghcr.io/esthenia-collaboration/rfswarm-agent-base:latest

ENV DISPLAY=:0 \
    MPLBACKEND=Agg

# Switch user root
USER root

# Install xvfb interface's dependencies
RUN apt-get update \
  && apt-get install --no-install-recommends -y xvfb libgl1-mesa-dri mesa-utils libosmesa6 libglapi-mesa vim \
  && rm -rf /var/lib/apt/lists/*

#  Install browser's dependencies 
RUN apt-get update && apt-get install -y wget

# Install google Chrome as browser. The last chrome's stable version will be installed.
# No need to install chromedriver while using SeleniumLibrary version 6.4.0 and further.
# The driver is already included in Selenium Library classes
RUN   wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
      apt-get install -y ./google-chrome-stable_current_amd64.deb && \
      rm google-chrome-stable_current_amd64.deb

# Install robot framework selenium library using pip
RUN pip install --upgrade pip \
    && pip install robotframework-seleniumlibrary

# Switch to custom rfagent user previously created in rfswarm agent base image
USER rfagent

# We will use this versionning below to display google chrome version in the package information      
RUN   google-chrome --version

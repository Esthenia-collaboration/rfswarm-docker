FROM  estheniacollaboration/rfswarm-agent-base:latest
ENV   DISPLAY=:0
ENV   SCREEN_WIDTH 1280
ENV   SCREEN_HEIGHT 720
ENV   SCREEN_DEPTH 16
ENV   PYTHONPATH="${PYTHONPATH}:/src/"

#  I deleted pip upgrade command in Dockerfile because it seems to cause some issues
#  Install xvfb interface's dependencies
RUN apt-get update -y \ 
  && apt-get install --no-install-recommends -y xvfb libgl1-mesa-dri mesa-utils libosmesa6 libglapi-mesa \
  && rm -rf /var/lib/apt/lists/*
#  Install robot framework selenium library using pip
RUN   pip install robotframework-seleniumlibrary      
#  Install firefox dependencies 
RUN   apt-get -y update && apt-get install -y wget curl dpkg libfreetype6 libfontconfig1 libxrender1 libasound-dev libdbus-glib-1-dev libgtk-3-dev libxt6 libdbus-glib-1-dev bzip2 jq 


#  Install firefox as browser. The last firefox stable version will be installed.
#=========
# Firefox
#=========
ARG FIREFOX_VERSION=latest
RUN if [ "$(dpkg --print-architecture)" = "amd64" ]; then \
        FIREFOX_DOWNLOAD_URL=$(if [ $FIREFOX_VERSION = "latest" ] || [ $FIREFOX_VERSION = "beta-latest" ] || [ $FIREFOX_VERSION = "nightly-latest" ] || [ $FIREFOX_VERSION = "devedition-latest" ] || [ $FIREFOX_VERSION = "esr-latest" ]; then echo "https://download.mozilla.org/?product=firefox-$FIREFOX_VERSION-ssl&os=linux64&lang=en-US"; else echo "https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2"; fi) ; \
    else \
        FIREFOX_DOWNLOAD_URL="https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64-aarch64&lang=en-US" ; \
    fi \
    && apt-get update -qqy \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    && wget --no-verbose -O /tmp/firefox.tar.bz2 $FIREFOX_DOWNLOAD_URL \
    && rm -rf /opt/firefox \
    && tar -xjf /tmp/firefox.tar.bz2 \
    && rm /tmp/firefox.tar.bz2 \
    && mv firefox /opt/firefox-$FIREFOX_VERSION \
    && ln -fs /opt/firefox-$FIREFOX_VERSION/firefox /usr/bin/firefox

#  Install geckodriver
#============
# GeckoDriver
#============
ARG GECKODRIVER_VERSION=latest
RUN LATEST_VERSION=$(curl -sk https://api.github.com/repos/mozilla/geckodriver/releases/latest | jq -r '.tag_name') \
  && DRIVER_ARCH=$(if [ "$(dpkg --print-architecture)" = "amd64" ]; then echo "linux64"; else echo "linux-aarch64"; fi) \
  && GK_VERSION=$(if [ ${GECKODRIVER_VERSION:-latest} = "latest" ]; then echo "${LATEST_VERSION}"; else echo $GECKODRIVER_VERSION; fi) \
  && echo "Using GeckoDriver version: "$GK_VERSION \
  && wget --no-verbose -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/${GK_VERSION}/geckodriver-${GK_VERSION}-${DRIVER_ARCH}.tar.gz \
  && rm -rf /opt/geckodriver \
  && tar -C /opt -zxf /tmp/geckodriver.tar.gz \
  && rm /tmp/geckodriver.tar.gz \
  && mv /opt/geckodriver /opt/geckodriver-$GK_VERSION \
  && chmod 755 /opt/geckodriver-$GK_VERSION \
  && ln -fs /opt/geckodriver-$GK_VERSION /usr/bin/geckodriver

# We will use this versionning below to display firefox version in the package information  
#============================================
# Dumping Browser information 
#============================================
RUN echo "firefox" 
RUN firefox --version

#==============================================================
# Run entrypoint.sh to set virtual display
#==============================================================
COPY  agent/seleniumlibrary-firefox/entrypoint.sh /opt/bin/entrypoint.sh
RUN   chmod +x /opt/bin/entrypoint.sh
ENTRYPOINT [ "/opt/bin/entrypoint.sh" ]

   

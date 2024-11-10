FROM  estheniacollaboration/rfswarm-agent-base:latest
ENV   DISPLAY=:0
ENV   MPLBACKEND=Agg
ENV   PYTHONPATH="${PYTHONPATH}:/src/"
#  I deleted pip upgrade command in Dockerfile because it seems to cause some issues
#  Install xvfb interface's dependencies
RUN apt-get update -y \
  && apt-get install --no-install-recommends -y xvfb libgl1-mesa-dri mesa-utils libosmesa6 libglapi-mesa \
  && rm -rf /var/lib/apt/lists/*
#  Install robot framework selenium library using pip
RUN   pip install robotframework-seleniumlibrary      
#  Install browser's dependencies 
RUN   apt-get -y update && apt-get install -y wget
#  Install google Chrome as browser. The last chrome's stable version will be installed.
#  No need to install chromedriver while using SeleniumLibrary version 6.4.0 and further. The driver is already included in Selenium Library classes
RUN   apt-get install -y libxss1 libappindicator1 
RUN   wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
      apt-get install -y ./google-chrome-stable_current_amd64.deb && \
      rm google-chrome-stable_current_amd64.deb   
# We will use this versionning below to display google chrome version in the package information      
RUN   google-chrome --version

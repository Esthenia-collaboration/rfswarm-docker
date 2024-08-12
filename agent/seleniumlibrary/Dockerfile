FROM  estheniacollaboration/rfswarm-agent-base-image
ENV   DISPLAY=:0
ENV   MPLBACKEND=Agg
ENV   PYTHONPATH="${PYTHONPATH}:/src/"
#  Install robot framework selenium library using pip
RUN   pip install --upgrade pip 
RUN   pip install robotframework-seleniumlibrary
#  Install xvfb interface's dependencies
RUN   apt-get update -qq && apt-get install sudo apt-utils python3-pip -y python-dev-is-python3 python3-tk  \
      python3-pil python3-pil.imagetk tk-dev gcc xvfb x11-xserver-utils  x11-apps
#  Install browser's dependencies 
RUN   apt-get -y update && apt-get install -y bc curl make libaio1 wget unzip bash build-essential postgresql-server-dev-all
#  Install google Chrome as browser The last chrome's stable version will be installed.
#  No need to install chromedriver while using SeleniumLibrary version 6.4.0 and further
RUN   apt-get install -y libcurl4 libxss1 libappindicator1 gdebi gnupg2
RUN   wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
      gdebi --n google-chrome-stable_current_amd64.deb && \
      rm google-chrome-stable_current_amd64.deb
# We will use this versionning below to display google chrome version in the package information      
RUN   google-chrome --version           

# Run the agent
ENTRYPOINT ["/opt/bin/entrypoint.sh"]

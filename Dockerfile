FROM resin/raspberrypi3-python:3.5-wheezy

ENV INITSYSTEM on

# Install Python.
RUN apt-get update \
  && apt-get install -y python3 \
    libudev-dev \
    python3-sphinx \
    python3-setuptools \
    sudo \
    git \
    vim \
    libboost-python-dev \
  # Remove package lists to free up space
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install homeassistant==0.39.3
RUN pip3 install sqlalchemy==1.1.4
RUN pip3 install aiohttp_cors==0.5.0
RUN pip3 install python-forecastio==1.3.5
RUN pip3 install astral
RUN pip3 install phue
RUN pip3 install xmltodict
RUN pip3 install cherrypy
RUN pip3 install static3
RUN pip3 install Werkzeug
RUN pip3 install astral
RUN pip3 install fuzzywuzzy
RUN pip3 install netdisco
RUN pip3 install urllib3
RUN pip3 install pyunifi==1.3
RUN pip3 install pyfttt==0.3

CMD ["python3","-m","homeassistant", "--config","/data"]

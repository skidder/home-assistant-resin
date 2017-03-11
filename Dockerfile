FROM resin/raspberrypi-python:3.5.1-wheezy

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
RUN pip3 install sqlalchemy
RUN pip3 install aiohttp_cors
RUN pip3 install python-forecastio
RUN pip3 install astral
RUN pip3 install phue
RUN pip3 install xmltodict
RUN pip3 install cherrypy
RUN pip3 install static3
RUN pip3 install Werkzeug
RUN pip3 install astral==1.3.4
RUN pip3 install fuzzywuzzy
RUN pip3 install netdisco==0.9.1
RUN pip3 install distro==1.0.2
RUN pip3 install urllib3
RUN pip3 install pyunifi==1.3
RUN pip3 install pyfttt

CMD ["python3","-m","homeassistant", "--config","/data"]

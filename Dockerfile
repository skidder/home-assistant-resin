FROM resin/raspberrypi-python:3.6.0-wheezy

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

RUN pip install homeassistant
RUN pip install sqlalchemy
RUN pip install aiohttp_cors
RUN pip install python-forecastio
RUN pip install astral
RUN pip install phue
RUN pip install xmltodict
RUN pip install cherrypy
RUN pip install static3
RUN pip install Werkzeug
RUN pip install astral==1.3.4
RUN pip install fuzzywuzzy
RUN pip install netdisco==1.0.1
RUN pip install distro==1.0.2
RUN pip install urllib3
RUN pip install pyunifi==2.13
RUN pip install pyfttt
RUN pip install ring_doorbell==0.1.4

CMD ["python3","-m","homeassistant","--config","/data"]

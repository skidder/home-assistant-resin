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

RUN pip3 install homeassistant==0.32.3
RUN pip3 install sqlalchemy
RUN pip3 install phue
RUN pip3 install xmltodict
RUN pip3 install cherrypy
RUN pip3 install static3
RUN pip3 install Werkzeug
RUN pip3 install astral
RUN pip3 install fuzzywuzzy
RUN pip3 install netdisco

CMD ["python3","-m","homeassistant", "--config","/data"]

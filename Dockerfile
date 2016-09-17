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
    bluetooth \
    libbluetooth-dev \
    libboost-python-dev \
  # Remove package lists to free up space
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install pybluez
RUN pip3 install homeassistant==0.28.2

CMD ["python3","-m","homeassistant", "--config","/data"]

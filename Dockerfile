FROM resin/raspberrypi2-python:3.5-wheezy

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
  # Remove package lists to free up space
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install homeassistant
RUN pip3 install --upgrade cython

RUN git clone https://github.com/OpenZWave/python-openzwave.git \
  && cd python-openzwave \
  && git checkout python3 \
  && PYTHON_EXEC=$(which python3) make build \
  && sudo PYTHON_EXEC=$(which python3) make install

CMD ["python3","-m","homeassistant", "--config","/data"]

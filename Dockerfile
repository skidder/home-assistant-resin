FROM resin/raspberrypi2-python:3.5-wheezy

ENV INITSYSTEM on

# Install Python.
RUN apt-get update \
	&& apt-get install -y python \
	# Remove package lists to free up space
	&& rm -rf /var/lib/apt/lists/*

RUN pip3 install homeassistant

CMD ["haas"]

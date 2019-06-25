# Use the prebuilt image with ubuntu desktop install and configured
FROM dorowu/ubuntu-desktop-lxde-vnc

ENV INSTALL_DIR '/pentaho/design-tools'

# Make the directories used for testing the ETL jobs and create volume mountpoints
# so they can be mapped to external directories
RUN mkdir /input /output /processed \
    && chmod -R 777 /input /output /processed

VOLUME ["/input", "/processed", "/output" ]

# Update all of the packages in the base OS and install java and other dependencies
# The curl and ping packages are just for debug
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get update  \
    && apt-get install -y unzip openjdk-8-jdk libwebkitgtk-1.0-0 iputils-ping curl \
    && rm -rf /var/lib/apt/lists/* 

# Copy the client installation zip
RUN mkdir -p ${INSTALL_DIR}
WORKDIR ${INSTALL_DIR}
COPY pdi-ce-8.2.0.0-342.zip .

# Unzip the pentaho installation files
RUN unzip -q pdi-ce-8.2.0.0-342.zip \
    && rm -f pdi-ce-8.2.0.0-342.zip


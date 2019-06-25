# Pentaho Client

## Description
This is an image for a pentaho client installed on an ubuntu desktop OS. It goes with another image which is the Pentaho server.

The idea is that these two images enable a complete Pentaho installation with a server and client components already preinstalled and configured.
## Pre-requisites
In order to build the image the pentaho client installation file called pdi-ce-8.2.0.0-342.zip needs to be downloaded from SourceForge. It is located at https://sourceforge.net/projects/pentaho/files/Pentaho%208.2/client-tools/pdi-ce-8.2.0.0-342.zip/download. 
## Building the image
```
$docker build -t joncatlin/pentaho-client .
```
## Running the image
```
$docker-compose up -d
```
## Using the container
In order to access and use the container a VNC client is required. Download and instal one and then access the container via port 5900.
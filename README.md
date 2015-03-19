README
======

## About ##

This repository contains the Dockerfiles used to deploy Lavagna

## Usage ##

docker run -d  -p 8080:8080 --name=lavagna --restart=always digitalfondue/lavagna

## Notes ##

The current version uses HSQLDB with file persistence, it works but it's intended to be used only as a demo.
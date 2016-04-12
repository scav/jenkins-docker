#!/bin/bash

clear

echo "Starting jenkins with socket linking at port 8000"

docker run -p 8080:8080 -p 50000:50000 -v /home/dag/data/jenkins2:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock localhost:5000/jenkins

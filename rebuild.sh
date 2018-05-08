#!/bin/bash

sudo docker build . -t peterducai/aidb:latest --pull 
sudo docker pull peterducai/aidb:latest
sudo docker push docker.io/peterducai/aidb
sudo docker stop aidb1 && sudo docker rm aidb1
sudo docker run -it --name aidb1 -p 5432:5432 -e POSTGRES_PASSWORD=post123 -d peterducai/aidb:latest
sudo docker logs aidb1
#! /usr/bin/env bash
docker pull chihchiu29/docker_roguelike
for imageId in $(docker images | grep "<none>" | tr -s " " | cut -f 3-3 -d " ");
do
    docker rmi -f ${imageId}
done

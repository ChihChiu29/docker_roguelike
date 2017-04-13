#! /usr/bin/env bash
# Additional command can be passed in as well.
if [ x$(docker-machine ls --quiet) == "x" ]; then
    machine_ip="localhost"
else
    machine_ip=$(docker-machine ip default)
fi

if [ x$@ == "x" ]; then
    echo
    echo "------------------------------------------------------------"
    echo "Browse page at http://${machine_ip}:8080"
    echo "You can register it with any info."
    echo "The save files will be in the 'saves' folder."
    echo "To quit, press ctrl-c."
    echo "------------------------------------------------------------"
    echo
    docker run -it -p 8080:8080 -v $(pwd)/saves:/crawl/crawl-ref/source/saves chihchiu29/docker_roguelike
else
    docker run -it -p 8080:8080 -v $(pwd)/saves:/crawl/crawl-ref/source/saves chihchiu29/docker_roguelike "$@"
fi

#! /usr/bin/env bash
# Additional command can be passed in as well.
if [ x$(docker-machine ls --quiet) == "x" ]; then
    machine_ip="localhost"
else
    machine_ip=$(docker-machine ip default)
fi

if [ x$@ == "x" ]; then
    echo
    echo '------------------------------------------------------------'
    echo 'To quit, press ctrl-c twice.'
    echo '------------------------------------------------------------'
    echo
    docker run -it -p 8080:8080 -v $(pwd)/saves:/crawl/crawl-ref/source/saves chihchiu29/docker_roguelike | sed s/localhost/${machine_ip}/g
else
    docker run -it -p 8080:8080 -v $(pwd)/saves:/crawl/crawl-ref/source/saves chihchiu29/docker_roguelike "$@"
fi

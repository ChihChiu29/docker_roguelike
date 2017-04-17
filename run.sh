#! /usr/bin/env bash
function show_usage() {
    echo
    echo "------------------------------------------------------------"
    echo "Usage reference:"
    echo "1. Run without arugments to start the server and map 'saves' as the save folder."
    echo "2. Run with argument 'nosave' to start the server and do not map 'saves' as the save folder."
    echo "3. Run with any other arguments will execute them in the docker image environment."
    echo "------------------------------------------------------------"
    echo
}

function show_link() {
    echo
    echo "------------------------------------------------------------"
    echo "Browse page at http://${machine_ip}:8080"
    echo "You can register it with any info."
    echo "The save files will be in the 'saves' folder."
    echo "To quit, press ctrl-c."
    echo "------------------------------------------------------------"
    echo
}

show_usage

# If the first argument is 
nosave=false
if [ $# > 0 ]
then
    if [ $1 == "nosave" ]
    then
        nosave=true
    fi
fi

# Get docker machine IP if exists.
if [ x$(docker-machine ls --quiet) == "x" ]
then
    machine_ip="localhost"
else
    machine_ip=$(docker-machine ip default)
fi

if [ $# == 0 ]
then
    show_link
    docker run -it -p 8080:8080 -v $(pwd)/saves:/crawl/crawl-ref/source/saves chihchiu29/docker_roguelike
elif [ $# == 1 ] && [ $1 == "nosave" ]
then
    show_link
    docker run -it -p 8080:8080 chihchiu29/docker_roguelike
else
    docker run -it -p 8080:8080 -v $(pwd)/saves:/crawl/crawl-ref/source/saves chihchiu29/docker_roguelike "$@"
fi

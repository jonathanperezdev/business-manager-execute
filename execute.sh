#!/bin/bash
echo "use -u flag to up and -d to down all the services"

while getopts ":ud" OPTION; do
    case $OPTION in
    u)
	ACTION='starting services'
	sudo docker network create BM_NETWORK
    	sudo docker-compose -f ./empleado-ui/docker-compose.yml up -d
    	sudo docker-compose -f ./cloud/docker-compose.yml up -d
    	sudo docker-compose -f ./empleado/docker-compose.yml up -d
        ;;
    d)
	ACTION='stopping services'
    	sudo docker-compose -f ./empleado-ui/docker-compose.yml down
    	sudo docker-compose -f ./cloud/docker-compose.yml down
    	sudo docker-compose -f ./empleado/docker-compose.yml down
        ;;
    *)
        echo "Incorrect options provided"
        exit 1
        ;;
    esac
done

echo "Action executed is $ACTION"
exit 0;

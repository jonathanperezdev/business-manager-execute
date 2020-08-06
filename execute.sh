#!/bin/bash
echo "use -u flag to up -b to build and up and -d to down all the services"

while getopts ":udb" OPTION; do
    case $OPTION in
    u)
	ACTION='starting services'
        sh configure.sh

        #Network
	    docker network create BM_NETWORK    	
        
        #Cloud
        docker-compose -f ./cloud/docker-compose.yml up -d

        #Empleado
        docker-compose -f ./empleado-ui/docker-compose.yml up -d
        docker-compose -f ./empleado/docker-compose.yml up -d
        
        #Horario
        docker-compose -f ./horario-ui/docker-compose.yml up -d
        docker-compose -f ./horario/docker-compose.yml up -d    	
        ;;
    b)
	ACTION='build and deploy services'
        sh configure.sh

        #Network
	    docker network create BM_NETWORK    	
        
        #Cloud
        mvn clean install -f ./cloud
        docker-compose -f ./cloud/docker-compose.yml up -d

        #Empleado
        yarn --cwd ./empleado-ui build
        docker-compose -f ./empleado-ui/docker-compose.yml up -d --build

        mvn clean install -f ./empleado
        docker-compose -f ./empleado/docker-compose.yml up -d
        
        #Horario
        yarn --cwd ./horario-ui build
        docker-compose -f ./horario-ui/docker-compose.yml up -d --build

        mvn clean install -f ./horario
        docker-compose -f ./horario/docker-compose.yml up -d
        ;; 
    d)
	ACTION='stopping services'
    	docker-compose -f ./empleado-ui/docker-compose.yml down
        docker-compose -f ./horario-ui/docker-compose.yml down
    	docker-compose -f ./cloud/docker-compose.yml down
    	docker-compose -f ./empleado/docker-compose.yml down
        docker-compose -f ./horario/docker-compose.yml down
        ;;    
    *)
        echo "Incorrect options provided"
        exit 1
        ;;
    esac
done

echo "Action executed is $ACTION"
exit 0;

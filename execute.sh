#!/bin/bash
echo "use -u flag to up"
echo "-b to build and up"
echo "-d to down all the services"
echo "-i to initializate services"

while getopts ":udbi" OPTION; do
    case $OPTION in
    u)
	ACTION='starting services'        
        sh configure.sh       

        #Network
	    docker network create BM_NETWORK
        
        #Cloud
        docker-compose -f ./cloud/docker-compose.yml up -d

        #Empleado
        docker-compose -f ./empleado/docker-compose.yml up -d
        docker-compose -f ./empleado-ui/docker-compose.yml up -d
        
        #Horario
        docker-compose -f ./horario/docker-compose.yml up -d
        docker-compose -f ./horario-ui/docker-compose.yml up -d

        #Nomina
        docker-compose -f ./nomina/docker-compose.yml up -d
        docker-compose -f ./nomina-ui/docker-compose.yml up -d
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

        #Nomina
        yarn --cwd ./nomina-ui build
        docker-compose -f ./nomina-ui/docker-compose.yml up -d --build

        mvn clean install -f ./nomina
        docker-compose -f ./nomina/docker-compose.yml up -d

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
        docker-compose -f ./nomina-ui/docker-compose.yml down    	
    	docker-compose -f ./empleado/docker-compose.yml down        
        docker-compose -f ./nomina/docker-compose.yml down
        docker-compose -f ./horario/docker-compose.yml down
        docker-compose -f ./cloud/docker-compose.yml down
        docker network rm BM_NETWORK
        ;;
    i)
    ACTION='Initializating config services'
        echo "Sending all parameters to nomina"
        curl -i http://localhost:8001/v1/horario/parametro/sendAllByMessage
        ;;    
    *)
        echo "Incorrect options provided"
        exit 1
        ;;
    esac
done

echo "Action executed is $ACTION"
exit 0;

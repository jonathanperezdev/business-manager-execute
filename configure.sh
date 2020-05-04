export BM_HOME=/home/jonathanperez/java/personal/business-manager
sudo ln -s $BM_HOME/backend/business-manager-cloud $BM_HOME/business-manager-execute/cloud
sudo ln -s $BM_HOME/backend/business-manager-empleado $BM_HOME/business-manager-execute/empleado
sudo ln -s $BM_HOME/frontend/business-manager-empleado-ui $BM_HOME/business-manager-execute/empleado-ui

echo "Script executed with BM_HOME in $BM_HOME"




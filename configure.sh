export BM_HOME=/home/jonathanperez/Documents/personal/intellij_projects/business-manager

#Backend
sudo ln -s $BM_HOME/backend/business-manager-cloud $BM_HOME/business-manager-execute/cloud
sudo ln -s $BM_HOME/backend/business-manager-empleado $BM_HOME/business-manager-execute/empleado
sudo ln -s $BM_HOME/backend/business-manager-horario $BM_HOME/business-manager-execute/horario

#FrontEnd
sudo ln -s $BM_HOME/frontend/business-manager-empleado-ui $BM_HOME/business-manager-execute/empleado-ui
sudo ln -s $BM_HOME/frontend/business-manager-horario-ui $BM_HOME/business-manager-execute/horario-ui

echo "Script executed with BM_HOME in $BM_HOME"




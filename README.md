# business-manager-execute
Allows make easy the installation process

##Business Manager Structure
The project business-manager should have the next structure

    .
    ├── business-manager                                # root business manager directory
        ├── frontend                                    # Frontend components
            ├──business-manager-empleado-ui             # Visual interfaces of empleado
        ├── backend                                     # Backend components
            ├──business-manager-cloud                   #Cloud infrastructure config, discovery and gateway server
            ├──business-manager-empleado                #Empleado backend API
        ├── business-manager-execute                    # Folder wit symbolic links to make easy the instalation process
    
##Configuration
1. First ar all clone this repo in the structure shown up
2. Modify the BM_HOME variable in configure.sh file pointing to business-manager folder
3. execute sudo chmod u+rwx configure.sh
4. execute sudo ./configure.sh to create the symbolic links that allow you start/stop the project

##Start and Stop Business-Manager

The backend projects should be build using mvn clean install command before start the components

1. execute sudo chmod u+rwx execute.sh
2. To start all the services just execute sudo ./execute.sh -u
3. To stop all the services just execute sudo ./execute.sh -d
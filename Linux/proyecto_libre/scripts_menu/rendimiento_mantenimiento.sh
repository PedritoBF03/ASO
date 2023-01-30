#!/bin/bash
menu() {
	echo "Supervisar el rendimiento y mantener los sistemas."
    echo 1. Visualizar información del sistema
	echo 2. Visualizar el almacenamiento del sistema
	echo 3. Visualizar CPU
	echo 4. Visualizar procesos
    echo 6. Salir
    echo ""
}

visualizar() {
	echo ""
	echo "-------------------------------------------------"
    echo ""
	top
	echo ""    
	echo "-------------------------------------------------"
    echo ""
}

almacenamiento() {
	echo ""
	echo "-------------------------------------------------"
    echo ""
	df -h
	echo ""    
	echo "-------------------------------------------------"
    echo ""
}

cpu() {
	echo ""
	echo "-------------------------------------------------"
    echo ""
	lscpu
	echo ""    
	echo "-------------------------------------------------"
    echo ""
}

procesos() {
	echo ""
	echo "-------------------------------------------------"
    echo ""
	ps
	echo ""    
	echo "-------------------------------------------------"
    echo ""
}

procesos_detallados() {
	echo ""
	echo "-------------------------------------------------"
    echo ""
	ps -e
	echo ""    
	echo "-------------------------------------------------"
    echo ""
}

while true;do
	menu
	read -p "Selecciona una opcion del menu: " n
	case $n in
        1)visualizar;;
		2)almacenamiento;;
		3)cpu;;
		4)procesos;;
		5)procesos_detallados;;
		6)exit;;
		*)echo "No existe ese numero en el menu";break;;
	esac
done
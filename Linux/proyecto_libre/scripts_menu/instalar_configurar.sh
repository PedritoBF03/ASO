#!/bin/bash
menu() {
    clear
    echo ""
    echo "ALGUNAS DE LAS FUNCIONES PUEDE SER QUE REQUIERAN LA CONTRASEÑA DE SUDO"
    echo ""
	echo "Instalar y configurar software y hardware."
    echo 1. Actualizar paquetes del sistema
    echo 2. Actualizar software a la ultima version posible
    echo 3. Instalar net-tools
    echo 4. Instalar PROFTPD
    echo 5. Instalar DHCP
    echo 6. Instalar apache
    echo 7. Activar o desactivar ufw
    echo 8. Instalar nmap
    echo 9. Salir
    echo ""
}

update() {
    sudo apt update
    sudo apt-get update
}

upgrade() {
    sudo apt upgrade
    sudo apt-get upgrade
}

net_tools() {
    echo ""
    echo "-------------------------------------------------"
    echo ""
    echo "Iniciando instalación de la herramienta net-tools"
    echo ""
    sudo apt-get install net-tools
    echo "Instalacion completada con exito" 
    echo ""
    echo "-------------------------------------------------"
    echo ""
}

ins_ftp() {
    echo ""
    echo "-------------------------------------------------"
    echo ""
    echo "Iniciando instalación del servicio ftp"
    echo ""
    sudo apt-get install proftpd
    echo "Instalacion completada con exito" 
    echo ""
    echo "-------------------------------------------------"
    echo ""
}

ins_dhcp() {
    echo ""
    echo "-------------------------------------------------"
    echo ""
    echo "Iniciando instalación del servicio dhcp"
    echo ""
    sudo apt-get install isc-dhcp-server
    echo "Instalacion completada con exito" 
    echo ""
    echo "-------------------------------------------------"
    echo ""
}

apache() {
    echo ""
    echo "-------------------------------------------------"
    echo ""
    echo "Iniciando instalación del servicio apache2"
    echo ""
    sudo apt install apache2
    echo "Instalacion completada con exito" 
    echo ""
    echo "-------------------------------------------------"
}

ufw() {

    VAR2=""

    echo ""
    echo "-------------------------------------------------"
    echo ""

    read -p "¿Quieres activar o desactivar ufw? [aceptar | desactivar] " opcion
        opcionminus=$(echo "${opcion,,}")
        if [ $opcionminus == "aceptar" ]
        then
            echo ""
            echo "Activando ufw"
            ufw enable
            echo "Activado con exito"
            echo ""
        else
            echo ""
            echo "Desactivando ufw"
            ufw disable
            echo "Desactivado con exito"
            echo ""
        fi

    echo ""
    echo "-------------------------------------------------"
    echo ""
}

nmap() {
    echo ""
    echo "-------------------------------------------------"
    echo ""
    echo "Iniciando instalación del servicio apache2"
    echo ""
    sudo apt install nmap
    echo "Instalacion completada con exito" 
    echo ""
    echo "-------------------------------------------------"
}

while true;do
	menu
	read -p "Selecciona una opcion del menu: " n
	case $n in
        1)update;clear;;
        2)upgrade;clear;;
        3)net_tools;;
        4)ins_ftp;;
        5)ins_dhcp;;
		6)apache;;
        7)ufw;;
        8)nmap;;
        9)exit;;
		*)echo "No existe ese numero en el menu";break;;
	esac
done
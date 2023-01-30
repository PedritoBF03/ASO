#!/bin/bash
menu() {
	clear
	echo ""
	echo MENU DE INICIO, SELECCIONE UNA OPCION
	echo 1. Instalar y configurar software y hardware.
    echo 2. Configurar las cuentas y los equipos de trabajo.
    echo 3. Supervisar el rendimiento y mantener los sistemas.
    echo 4. Garantizar la seguridad mediante copias de seguridad y cortafuegos.
    echo 5. Instalar una base de datos mariadb y entrar a la consola mediante mariadb.
    echo 6. Salir
    echo ""
}

instalar_configurar() {
	./scripts_menu/instalar_configurar.sh
}

configurar_cuentas_y_equipo() {
	./scripts_menu/configurar_cuentas_y_equipo.sh
}

rendimiento_mantenimiento() {
	./scripts_menu/rendimiento_mantenimiento.sh
}

seguridad() {
	./scripts_menu/seguridad.sh
}

bbdd() {
	./scripts_menu/bbdd.sh
}


while true;do
	menu
	read -p "Selecciona una opcion del menu: " n
	case $n in
		1)clear;instalar_configurar;;
		2)clear;configurar_cuentas_y_equipo;;
		3)clear;rendimiento_mantenimiento;;
		4)clear;seguridad;;
		5)clear;bbdd;;
		6)exit;;
		*)echo "No existe ese numero en el menu";break;;
	esac
    
done
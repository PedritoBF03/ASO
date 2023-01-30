#!/bin/bash
menu() {
	echo "Garantizar la seguridad mediante copias de seguridad y cortafuegos."
    echo 1. Instalar mariadb
	echo 2. Entrar a la consola de MariaDB
	echo 3. Salir
    echo ""
}

instalar() {
	echo ""
    echo "-------------------------------------------------"
    echo ""
	sudo apt install mariadb-server
	echo ""
	sudo apt install proftpd-mod-mysql
    echo ""
    echo "-------------------------------------------------"
    echo ""
}

entrar() {
	read -p "¿Con que usuario vas a entrar a la consola de mariadb? [recomendacion como root] " usuario
	sudo mysql -u ${usuario}
}

while true;do
	menu
	read -p "Selecciona una opcion del menu: " n
	case $n in
        1)instalar;;
		2)entrar;;
		3)exit;;
		*)echo "No existe ese numero en el menu";break;;
	esac
done
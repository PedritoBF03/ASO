#!/bin/bash
menu() {
	echo "Garantizar la seguridad mediante copias de seguridad y cortafuegos."
    echo 1. Activar UFW
	echo 2. Desactivar UFW
	echo 3. Abrir puerto UFW
	echo 4. Ver rules añadidas a UFW 
	echo 5. Ver puertos abiertos
	echo 6. Realizar copia de seguridad de un directorio específico
    echo 7. Salir
    echo ""
}

activar_ufw() {
	echo ""
    echo "Activando ufw"
    sudo ufw enable
    echo "Activado con exito"
    echo ""
}

desactivar_ufw() {
    echo ""
    echo "Desactivando ufw"
    sudo ufw disable
    echo "Desactivado con exito"
    echo ""
}

abrir_puerto() {
	echo ""
	read -p "¿Que puerto es el que quieres abrir?: " puerto_n
	echo ""
    echo "Desactivando ufw"
    sudo ufw allow ${puerto_n}
    echo "Puerto ${puerto_n} abierto con exito"
    echo ""
}

ver_rules() {
	echo ""
    echo "-------------------------------------------------"
    echo ""
	sudo ufw status
	echo ""
    echo "-------------------------------------------------"
    echo ""
	read -p "Pulsa cualquier boton para continuar: " espacio
}

ver_puertos() {
	echo ""
	echo "Para la visualizacion se utiliza nmap se ejecutara el comando de instalacion por si acaso no lo tuvieses instalado"
	echo ""
	sudo apt install nmap
	echo ""
	echo "Ahora vamos a proceder con la visualizacion: "
	echo ""
    echo "-------------------------------------------------"
    echo ""
	nmap localhost
	echo ""
    echo "-------------------------------------------------"
    echo ""
	read -p "Pulsa cualquier boton para continuar hacia el menu: " espacio
}

copia() {
	echo ""
    echo "-------------------------------------------------"
    echo ""
	read -p "Especifica un nombre para identificar la copia de seguridad: " nombre
	read -p "Especifica la ruta de la que quieres realizar la copia de seguridad completa [ejemplo /home/user]: " ruta
	read -p "Especifica ruta y nombre de fichero donde se guardara la copia de seguridad: " ruta_backup
	echo ""
	tar -cpvzf "${nombre}.tgz" -g ${ruta_backup}.snap ${ruta}
	echo ""
    echo "-------------------------------------------------"
    echo ""
	read -p "Pulsa cualquier boton para continuar: " espacio
}


while true;do
	menu
	read -p "Selecciona una opcion del menu: " n
	case $n in
        1)activar_ufw;;
		2)desactivar_ufw;;
		3)abrir_puerto;;
		4)ver_rules;;
		5)ver_puertos;;
		6)copia;;
		7)exit;;
		*)echo "No existe ese numero en el menu";break;;
	esac
done
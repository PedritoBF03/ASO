#!/bin/bash
menu() {
	echo "Configurar las cuentas y los equipos de trabajo."
	echo 1. Crear un usuario
    echo 2. Modificar usuario
    echo 3. Crear grupo
    echo 4. Añadir un usuario a un grupo
    echo 5. Cambiar la direccion ip
    echo 6. Cambiar nombre del equipo
    echo 7. Salir
    echo ""
}

crear_usuario() {
    echo ""
    read -p "Especifica el nombre del usuario que deseas crear: " username
    
        if [ "$username" ]
        then   

            sudo useradd ${username}
            echo ""
            echo "Usuario creado con exito"
            echo ""

            read -p "Quieres añadir contraseña al usuario (Si eliges no entonces el usuario estara bloqueado): " opcion
            opcionminus=$(echo "${opcion,,}")
            if [ $opcionminus == "si" ]
            then
                sudo passwd ${username}
            else
                echo ""
                echo "Dijistes no, saliendo del script, recuerda que ahora deberas de activar el usuario o ponerle una contraseña."
                echo ""
                exit
            fi

        else
            echo ""
            echo "No puedes dejar el nombre en blanco"
            echo ""
        fi

    echo ""

}

modificar_usuario() {
    echo ""
    read -p "Especifica el nombre del usuario que deseas modificar: " username

    if [ "$username" ]
        then
            sudo passwd ${username}
            echo ""
        else
            echo ""
            echo "No puedes dejar el nombre en blanco"
            echo ""
    fi

}

crear_grupo() {
    echo ""
    read -p "Especifica el nombre del grupo que deseas crear: " groupname

    if [ "$groupname" ]
        then
            sudo groupadd ${groupname}
            echo ""
        else
            echo ""
            echo "No puedes dejar el grupo en blanco"
            echo ""
    fi

}

añadir_a_grupo() {
    echo ""
    read -p "Especifica el nombre del usuario a añadir al grupo: " user

    if [ "$user" ]
    then
            read -p "Especifica el nombre del grupo al que quieres añadir al usuario: " groupname    
            if [ "$groupname" ]
            then
                useradd ${user} ${groupname}
                echo "" 
            else
                echo ""
                echo "No puedes dejar el grupo en blanco"
                echo ""
            fi
    else
        echo ""
        echo "No puedes dejar el usuario en blanco"
        echo ""
    fi

}

cambiar_ip() {
    read -p "Especifica la direccion ip que quieres establecer: " direccion_ip
    if [ "$direccion_ip" ]
    then
        read -p "Especifica la mascara de red que quieres establecer: " mascara
        if [ "$mascara" ]
        then
            sudo ifconfig eth0 ${direccion_ip} netmask ${mascara}
        else
            echo ""
            echo "No puedes dejar la mascara en blanco"
            echo ""
        fi
        
    else
        echo ""
        echo "No puedes dejar la dirección ip en blanco"
        echo ""
    fi
}

nombre() {
    echo ""
    echo "-------------------------------------------------"
    echo ""
    read -p "Que nombre le quieres poner a este equipo: " nombre
    echo ""
    echo "Cambiando nombre al equipo" 
    sudo hostname ${nombre}
    echo ""
    echo "Nombre cambiado con exito"
    echo ""
    sudo hostname
    echo ""
    echo "-------------------------------------------------"
    echo ""
}

while true;do
	menu
	read -p "Selecciona una opcion del menu: " n
	case $n in
		1)crear_usuario;;
        2)modificar_usuario;;
        3)crear_grupo;;
        4)añadir_a_grupo;;
        5)cambiar_ip;;
		6)nombre;;
        7)exit;;
		*)echo "No existe ese numero en el menu";break;;
	esac
done
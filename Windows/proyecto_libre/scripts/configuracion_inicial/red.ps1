function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "                RED"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Obtener adaptadores de red"
    Write-Host "2. Obtener informacion de un adaptador"
    Write-Host "3. Renombrar adaptador"
    Write-Host "4. Establecer ip estatica y desactivar DHCP"
    Write-Host "5. Comprobar un solo adaptador de red"
    Write-Host "6. Asignar un servidor dns, una ip y un gateway a un adaptador"
    Write-Host "7. Asignar un servidor dns a un adaptador"
    Write-Host "8. Eliminar una ip de un adaptador"
    Write-Host "9. Resetear informacion de un adaptador"
	Write-Host "10. Salir"
}

menu

function obtener_adaptadores{
	get-netadapter | ft
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function obtener_info_adaptador{
    Write-Host ""
    get-netadapter | ft
    Write-Host ""

    $nombre_adaptador = Read-Host -prompt "Di el nombre del adaptador a ver su informacion"
    if ($nombre_adaptador) {
        Get-NetIPConfiguration -InterfaceAlias $nombre_adaptador
    }
    else {
        'No puedes dejar el nombre del adaptador en blanco'
    }

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function renombrar_adaptador{
    get-netadapter | ft
	$nombre_adaptador = Read-Host -prompt "Di el nombre del adaptador a cambiar"
    if ($nombre_adaptador) {
		$nuevo_nombre = Read-Host -prompt "Di el nuevo nombre para asignar al adaptador"
        if ($nuevo_nombre) {
            rename-netadapter -name $nombre_adaptador -newname $nuevo_nombre
        }
        else {
            'No puedes dejar el nuevo nombre del adaptador en blanco'
        }
	}
	else {
		'No puedes dejar el nombre del adaptador en blanco'
	}

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ip_estatica{
    get-netadapter | ft
    Write-Host ""
    $nombre_adaptador = Read-Host -prompt "Di el nombre del adaptador a cambiar"

    if ($nombre_adaptador) {
        $ip_asignar = Read-Host -prompt "Di la dirreccion ip que quieres asignar"
        if ($ip_asignar) {
            $mascara = Read-Host -prompt "Di la mascara para asignar a la ip "
            if ($mascara) {
                set-netipinterface -interfacealias $nombre_adaptador -Dhcp Disabled
                new-netipaddress -interfacealias $nombre_adaptador -ipaddress $ip_asignar -prefixlength $mascara
            }
            else {
                'No puedes dejar sin asignar ninguna mascara a la ip'
            }

        }
        else {
            'No puedes dejar sin asignar ninguna ip'
        }
	}
	else {
		'No puedes dejar el nombre del adaptador en blanco'
	}

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function obtener_un_adaptador {
    get-netadapter | ft
    Write-Host ""
    $nombre_adaptador = Read-Host -prompt "Di el nombre del adaptador que quieres obtener informacion"
    if ($nombre_adaptador) {
        get-netipconfiguration -interfacealias $nombre_adaptador
    }
    else {
        'No puedes dejar sin especificar el nombre adaptador'
    }
    
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function establecer_ip_y_dns {
    get-netadapter | ft
    Write-Host ""
    $interface_index = Read-Host -prompt "Di el nombre del adaptador a cambiar"
    if ($interface_index) {

        $ip_asignar = Read-Host -prompt "Di la nueva direccion ip a asignar"
        if ($ip_asignar) {

            $mascara = Read-Host -prompt "Di la nueva mascara a asignar a la ip (24)"
            if ($mascara) {
                
                $gateway = Read-Host -prompt "Di la ip de la puerta de enlace de tu red"
                if ($gateway) {
                
                    $dns = Read-Host -prompt "Di la ip del servidor dns a asignar"
                    if ($dns) {
                
                        New-NetIPAddress -interfacealias   $interface_index -IPAddress $ip_asignar -PrefixLength $mascara -DefaultGateway $gateway
                        Set-DNSClientServerAddress -interfacealias $interface_index -ServerAddresses $dns

                    }
                    else {
                        'No puedes dejar la ip del dns a asignar'
                    }

                }
                else {
                    'No puedes dejar la puerta de enlace por defecto en blanco'
                }

            }
            else {
                'No puedes dejar la mascara de la ip en blanco'
            }

        }
        else {
            'No puedes dejar la ip en blanco'
        }

    }
    else {
        'No puedes dejar el interfaz del adaptador en blanco'
    }
    
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function asignar_dns {
    get-netadapter | ft
    Write-Host ""

    $interface_index = Read-Host -prompt "Di el nombre del adaptador a cambiar el dns"
    if ($interface_index) {
                
        $dns = Read-Host -prompt "Di la ip del servidor dns a asignar"
        if ($dns) {
            Set-DNSClientServerAddress -interfacealias $interface_index -ServerAddresses $dns
        }
        else {
            'No puedes dejar la ip del dns a asignar en blanco'
        }

    }
    else {
        'No puedes dejar el index del adaptador en blanco'
    }

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function eliminar_configuracion {
    get-netadapter | ft
    Write-Host ""

    $ipa = Read-Host -prompt "Di el nombre del adaptador para borrar la ip"
    if ($ipa) {
       
        $gateway = Read-Host -prompt "Di el nombre de la puerta de enlace a borrar"
        if ($gateway) {
            Remove-NetIPAddress -interfacealias $ipa -DefaultGateway $gateway
        }
        else {
            'No puedes dejar la puerta de enlace en blanco'
        }

    }
    else {
        'No puedes dejar el nombre del adaptador en blanco'
    }

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function resetear_configuracion {
    get-netadapter | ft
    Write-Host ""

    $interface_index = Read-Host -prompt "Di la nombre del interfaz para resetear"
    if ($interface_index) {
       Set-DnsClientServerAddress -interfacealias $interface_index -ResetServerAddresses
    }
    else {
        'No puedes dejar el index en blanco'
    }

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}



while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "10"){
	switch ($opcion ) {
	1 {obtener_adaptadores}
    2 {obtener_info_adaptador}
	3 {renombrar_adaptador}
	4 {ip_estatica}
	5 {obtener_un_adaptador}
    6 {establecer_ip_y_dns}
	7 {asignar_dns}
    8 {eliminar_configuracion}
    9 {resetear_configuracion}
	10 {"Exit"; break}
	}
	menu
}
function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "           SEGURIDAD"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Ver puertos abiertos"
    Write-Host "2. Abrir un puerto"
	Write-Host "3. Obtener normas del firewall"
	Write-Host "4. Habilitar / Desabilitar el firewall"
    Write-Host "5. Desactivar firewall en todos los perfiles"
    Write-Host "6. Desactivar firewall completo en el equipo"
    Write-Host "7. Ver el estado de los diferentes perfiles de firewall"
	Write-Host "8. Salir"
}

menu

function puertos {
	Write-Host ""
    netstat -a
	Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function abrir_puerto {
    Write-Host ""

    $descripcion = Read-Host -prompt "Di una descripcion para la norma a añadir"
    if ($descripcion) {
        
        $puerto_n = Read-Host -prompt "Di el numero del puerto a abrir (443)"
        if ($puerto_n) {
            
            $protocolo = Read-Host -prompt "Di el protocolo del puerto a abrir (TCP)"
            if ($protocolo) {
                New-NetFirewallRule -DisplayName "$descripcion" -Direction inbound -Profile Any -Action Allow -LocalPort $puerto_n -Protocol $protocolo
            }
            else {
                'No puedes dejar el protocolo en blanco'
            }

        }
        else {
            'No puedes dejar el puerto en blanco'
        }

    }
    else {
        'No puedes dejar la descripcion vacia'
    }

	Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"

}

function firewall {
	Write-Host ""
    Get-command *Firewall*
	Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function h_d_firewall {
	Write-Host ""
    Set-NetFirewallProfile
	Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function d_firewall_perfiles {
	Write-Host ""
    Set-NetFirewallProfile -Enabled false
	Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function d_firewall_completo {
	Write-Host ""
    Set-NetFirewallProfile -Enabled true
	Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ver_estado_firewall {
	Write-Host ""
    Get-NetFirewallProfile
	Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}



while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "8"){
	switch ($opcion ) {
	1 {puertos}
	2 {abrir_puerto}
	3 {firewall}
	4 {h_d_firewall}
	5 {d_firewall_perfiles}
    6 {d_firewall_completo}
    7 {ver_estado_firewall}
	8 {"Exit"; break}
	}
	menu
}


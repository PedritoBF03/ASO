function menu {
	# Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "         INSTALAR CONFIGURAR"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Instalar active directory y las herramientas de gestion"
    Write-Host "2. Comprobar que se instalo correctamente el rol"
    Write-Host "3. Crear un nuevo bosque"
    Write-Host "4. Comprobar los bosques del sistema"
    Write-Host "5. Script para obtener informacion de los equipos de un dominio"
    Write-Host "6. Ver todos los equipos del dominio"
	Write-Host "7. Salir"
}

menu


function active {
    Write-Host ""

    Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

    Write-Host ""
    Write-Host "Instalacion realizada correctamente"        
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function comprobar_active {
    Write-Host ""

    Get-WindowsFeature AD-Domain-Services
        
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function crear_bosque {
    Write-Host ""

    $dc1 = Read-Host -prompt "Inserta el nombre del grupo a crear (nievabus)"
	if ($dc1) {
		
        $dc2 = Read-Host -prompt "Inserta el nombre del grupo a crear (com)"
	    if ($dc2) {
		
            Install-ADDSForest -DomainName $dc1.$dc2 -InstallDns

	    }
	    else {
		    'No puedes dejar el dc2 en blanco'
	    }

	}
	else {
		'No puedes dejar el dc1 en blanco'
	}

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function comprobar_bosque{
    Write-Host ""
    Get-ADDomainController
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function info_equipos_dominio{
    Write-Host ""
    Import-Module ActiveDirectory
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ver_equipos_dominio{
    Write-Host ""
    $Equipos = Get-ADComputer -Filter *
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}


while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "7"){
	switch ($opcion ) {
	1 {active}
	2 {comprobar_active}
	3 {crear_bosque}
    4 {comprobar_bosque}
    5 {info_equipos_dominio}
    6 {ver_equipos_dominio}
	7 {"Exit"; break}
	}
	menu
}
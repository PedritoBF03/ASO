function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "           RENDIMIENTO"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Eventos"
    Write-Host "2. Ver informacion de los escritorios en el equipo local"
    Write-Host "3. Enumerar informacion de la BIOS"
    Write-Host "4. Enumerar informacion de la CPU"
    Write-Host "5. Modelo y fabricante del equipo"
    Write-Host "6. Revisiones instaladas"
    Write-Host "7. Ver version instalada del SO"
    Write-Host "8. Ver usuarios y propietarios locales"
    Write-Host "9. Obtener espacio en disco"
	Write-Host "10. Salir"
}

menu

function info_escritorio {
    Write-Host ""

    Get-CimInstance -ClassName Win32_Desktop
    
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function bios {
    Write-Host ""

    Get-CimInstance -ClassName Win32_BIOS
        
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function cpu {
    Write-Host ""

    Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*"
            
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function fabricante {
    Write-Host ""

    Get-CimInstance -ClassName Win32_ComputerSystem
            
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function revisiones {
    Write-Host ""

    Get-CimInstance -ClassName Win32_QuickFixEngineering
            
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function version_so {
    Write-Host ""

    Get-CimInstance -ClassName Win32_OperatingSystem |
    Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
            
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function propietarios_usuarios {
    Write-Host ""

    Get-CimInstance -ClassName Win32_OperatingSystem |
    Select-Object -Property NumberOfLicensedUsers, NumberOfUsers, RegisteredUser
            
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function disco {
    Write-Host ""

    Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
            
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "10"){
	switch ($opcion ) {
	1 {.\scripts\rendimiento\eventos.ps1}
	2 {info_escritorio}
	3 {bios}
	4 {cpu}
	5 {fabricante}
    6 {revisiones}
    7 {version_so}
    8 {propietarios_usuarios}
    9 {disco}
	10 {"Exit"; break}
	}
	menu
}
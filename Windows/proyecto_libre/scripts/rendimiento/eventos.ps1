function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "             EVENTOS"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Eventos"
    Write-Host "2. Ver informacion de un solo evento"
    Write-Host "3. Ver ultimos 10 errores en el sistema de registro"
	Write-Host "4. Salir"
}

menu

function listar {
    Write-Host ""
    
    get-eventlog -list | ft

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function info_envento {
    Write-Host ""
    get-eventlog -list
    Write-Host ""
    
    $evento = Read-Host -prompt "Di el nombre del adaptador a ver su informacion"
    if ($evento) {
        get-eventlog $evento
    }
    else {
        'No puedes dejar el nombre del evento en blanco'
    }

    

    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function errores {
    Write-Host ""
    Get-EventLog -Logname System -EntryType Error -Newest 10 | Format-Table TimeGenerated,Source,Message -Wrap
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}



while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "4"){
	switch ($opcion ) {
	1 {listar}
	2 {info_envento}
	3 {errores}
	4 {"Exit"; break}
	}
	menu
}



    # $nombre_adaptador = Read-Host -prompt "Di el nombre del adaptador a ver su informacion"
    # if ($nombre_adaptador) {
    #     Get-NetIPConfiguration -InterfaceAlias $nombre_adaptador
    # }
    # else {
    #     'No puedes dejar el nombre del adaptador en blanco'
    # }
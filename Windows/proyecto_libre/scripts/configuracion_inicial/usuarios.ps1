function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "             USUARIOS"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Listar usuarios"
	Write-Host "2. Crear usuarios"
	Write-Host "3. Borrar usuario"  
	Write-Host "4. Salir"
}

menu

function ver {
    
    Get-LocalUser
    
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function crear {
    Write-Host ""
    
    $nombre_usuario = Read-Host -prompt "Inserta el nombre del usuario a crear"
	if ($nombre_usuario) {
		
        $password = Read-Host -prompt "Inserta una contraseña al usuario"
	    if ($password) {
            New-LocalUser $nombre_usuario -Password (ConvertTo-SecureString "$password" -asplaintext -force)
	    }
	    else {
		    'No puedes dejar la contraseña en blanco'
	    }

	}
	else {
		'No puedes dejar el nombre del usuario en blanco'
	}

    Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function borrar {
    Write-Host ""

    $nombre_usuario = Read-Host -prompt "Inserta el nombre del usuario a borrar"
    if ($nombre_usuario) {
        Remove-LocalUser $nombre_usuario
    }
    else {
	    'No puedes dejar el nombre en blanco'
    }

    Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}






while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "4"){
	switch ($opcion ) {
	1 {ver}
	2 {crear}
	3 {borrar}
	4 {"Exit"; break}
	}
	menu
}
function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "              GRUPOS"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Listar grupos"
	Write-Host "2. Crear grupo"
	Write-Host "3. Borrar grupo"
    Write-Host "4. Añadir usuario a grupo"
    Write-Host "5. Obtener información de un grupo"
    Write-Host "6. Eliminar usuario de un grupo"
	Write-Host "7. Salir"
}

menu

function ver {
    	Write-Host ""
    	Get-LocalGroup
    	Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function crear {
    Write-Host ""
    
    	$nombre_grupo = Read-Host -prompt "Inserta el nombre del grupo a crear"
	if ($nombre_grupo) {
		
		New-LocalGroup $nombre_grupo		

	}
	else {
		'No puedes dejar el nombre del grupo en blanco'
	}

    	Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function borrar {
    Write-Host ""

    $nombre_grupo = Read-Host -prompt "Inserta el nombre del grupo a borrar"
    if ($nombre_grupo) {
	Remove-LocalGroup $nombre_grupo
    }
    else {
	    'No puedes dejar el nombre del grupo en blanco'
    }

    	Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function añadir_usu {
    	Write-Host ""

    	$nombre_usuario = Read-Host -prompt "Inserta el nombre del usuario a añadir"
    	if ($nombre_usuario) {
		
		$nombre_grupo = Read-Host -prompt "Inserta el nombre del grupo a añadir el usuario"
    		if ($nombre_grupo) {
			Add-LocalGroupMember -Member $nombre_usuario -Group $nombre_grupo
    		}
    		else {
	    		'No puedes dejar el nombre del grupo en blanco'
    		}

    	}
    	else {
	    	'No puedes dejar el nombre del usuario en blanco'
    	}

    	Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ver_grupo {
    	Write-Host ""

	$nombre_grupo = Read-Host -prompt "Inserta el nombre del grupo a visualizar"
    	if ($nombre_grupo) {
		Get-LocalGroupMember $nombre_grupo
    	}
    	else {
		'No puedes dejar el nombre del grupo en blanco'
    	}

    	Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function eliminar_usu_grupo {
	Write-Host ""

	$nombre_usuario = Read-Host -prompt "Inserta el nombre del usuario a eliminar del grupo"
    	if ($nombre_usuario) {
		
		$nombre_grupo = Read-Host -prompt "Inserta el nombre del grupo"
    		if ($nombre_grupo) {
			Remove-LocalGroupMember -Member $nombre_usuario -Group $nombre_grupo
    		}
    		else {
			'No puedes dejar el nombre del grupo en blanco'
    		}

    	}
    	else {
		'No puedes dejar el nombre del usuario en blanco'
    	}

    	Write-Host ""
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}




while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "7"){
	switch ($opcion ) {
	1 {ver}
	2 {crear}
	3 {borrar}
    4 {añadir_usu}
    5 {ver_grupo}
    6 {eliminar_usu_grupo}
	7 {"Exit"; break}
	}
	menu
}
function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "      CONFIGURACION INICIAL"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Cambiar nombre a equipo"
	Write-Host "2. Configuracion de red"
	Write-Host "3. Configuracion de Zonas horarias"
	Write-Host "4. Configurar actualizaciones"   
	Write-Host "5. Configurar usuarios"
	Write-Host "6. Configurar grupos"
    Write-Host "7. Reiniciar equipo"   
	Write-Host "8. Salir"
}

menu

function cambiar_nombre{
	$nombre_equipo = Read-Host -prompt "Inserta el nombre de la unidad a crear (socios)"
	if ($nombre_equipo) {
		rename-computer $nombre_equipo
	}
	else {
		'No puedes dejar el nombre del equipo en blanco'
	}
	Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function reiniciar_equipo {
	restart-computer
}


while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "8"){
	switch ($opcion ) {
	1 {cambiar_nombre}
	2 {./scripts/configuracion_inicial/red.ps1}
	3 {./scripts/configuracion_inicial/zona_horaria.ps1}
	4 {./scripts/configuracion_inicial/actualizaciones.ps1}
	5 {./scripts/configuracion_inicial/usuarios.ps1}
	6 {./scripts/configuracion_inicial/grupos.ps1}
	7 {reiniciar_equipo}
	8 {"Exit"; break}
	}
	menu
}
function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "           MENU PRINCIPAL"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Comprobaciones"
	Write-Host "2. Configurar inicial (cuentas y los equipos de trabajo)"
	Write-Host "3. Supervisar el rendimiento y mantener los sistemas"
	Write-Host "4. Instalar y configurar software y hardware"
	Write-Host "5. Garantizar la seguridad mediante controles de acceso, copias de seguridad, y cortafuegos"
	Write-Host "6. Salir"
}

menu



while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "6"){
	switch ($opcion ) {
	1 {.\scripts\comprobaciones.ps1}
	2 {.\scripts\configuracion_inicial.ps1}
	3 {.\scripts\rendimiento.ps1}
	4 {.\scripts\Instalar_configurar.ps1}
	5 {.\scripts\seguridad.ps1}
	6 {"Exit"; break}
	}
	menu
}
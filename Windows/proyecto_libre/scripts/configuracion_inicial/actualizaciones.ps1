function menu {
	# Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "           ACTUALIZACIONES"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Configurar actualizaciones automaticas"
	Write-Host "2. Comprobar actualizaciones instaladas"
    Write-Host "3. Comprobar actualizaciones de seguridad instaladas"
	Write-Host "4. Salir"
}

menu

function automaticas{
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 3
}

function instaladas{
    Get-HotFix
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function seguridad_instaladas{
    Get-HotFix -description "Security Update"
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}



while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "4"){
	switch ($opcion ) {
	1 {automaticas}
	2 {instaladas}
	3 {seguridad_instaladas}
	4 {"Exit"; break}
	}
	menu
}
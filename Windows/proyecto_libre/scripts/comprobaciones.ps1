function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "           MENU PRINCIPAL"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Obtener adaptadores de red"
	Write-Host "2. Ver zona horaria actual"
	Write-Host "3. Comprobar actualizaciones instaladas"
	Write-Host "4. Ver usuarios locales"
    Write-Host "5. Ver grupos locales"
	Write-Host "6. Ver alias del sistema"
	Write-Host "7. Ver modulos"
	Write-Host "8. Ver historial de cmdlets"
	Write-Host "9. Salir"
}

menu

function obtener_adaptadores{
	get-netadapter
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function zona_horaria{
	Get-Timezone
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function actualizaciones_insta{
	Get-HotFix
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ver_usuarios{
	Get-LocalUser
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ver_grupos{
	Get-LocalGroup
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function alias{
	Get-Alias
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ver_modulos{
	Get-Module
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function h_cmdlet{
	Get-History
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}



while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "9"){
	switch ($opcion ) {
	1 {obtener_adaptadores}
	2 {zona_horaria}
	3 {actualizaciones_insta}
	4 {ver_usuarios}
	5 {ver_grupos}
	6 {alias}
	7 {ver_modulos}
	8 {h_cmdlet}
	9 {"Exit"; break}
	}
	menu
}
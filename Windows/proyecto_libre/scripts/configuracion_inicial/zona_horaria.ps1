function menu {
	Clear-Host
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "           ZONA HORARIA"
	Write-Host ""
	Write-Host "-----------------------------------"
	Write-Host ""
	Write-Host "1. Ver zona horaria acual"
	Write-Host "2. Ver zonas horarias"
	Write-Host "3. Asignar zona horaria"
	Write-Host "4. Salir"
}

menu

function ver_actual {
    Write-Host ""
    Get-TimeZone
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function ver_zonas {
    Write-Host ""
    Get-TimeZone -ListAvailable
    Write-Host ""
    Read-Host -prompt "Pulsa cualquier tecla para continuar"
}

function asignar{

    $zona_h = Read-Host -prompt "Di el nombre de la zona horaria para asignar"
    if ($zona_h) {
        Set-TimeZone -Name $zona_h
    }
    else {
        'No puedes dejar la zona horaria vacia'
    }

}

while(($opcion = Read-Host -prompt "Selecciona una opcion") -ne "4"){
	switch ($opcion ) {
	1 {ver_actual}
	2 {ver_zonas}
	3 {asignar}
	4 {"Exit"; break}
	}
	menu
}
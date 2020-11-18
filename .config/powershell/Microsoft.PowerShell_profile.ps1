# $HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
#
function osFamily {
	$osFamily = "Linux"
	return $osFamily
}

$osFamily = osFamily
if( $osFamily -eq "Linux" ) {
	$PowerShellUserConfigDIR="$HOME/.config/powershell"
} elseif( $osFamily -eq "Windows" ) {
	Set-Alias vi "$env:ProgramFiles/Git/usr/bin/vim.exe"
	Set-Alias  ex
} elseif( $osFamily -eq "Darwin" ) {
	echo TO DO
}

Import-Alias "$PowerShellUserConfigDIR/seb_${osFamily}_aliases.ps1"

function Prompt {
    $mywd = (pwd).Path
    $mywd = $mywd.Replace( $HOME, '~' )
#    $PSHVersion = $PSVersionTable.PSVersion.ToString()
    $PSHVersion = ""+$PSVersionTable.PSVersion.Major + "." + $PSVersionTable.PSVersion.Minor
    Write-Host "[$osFamily] " -NoNewline -ForegroundColor DarkRed
    Write-Host "PSv$PSHVersion " -NoNewline -ForegroundColor DarkBlue
    Write-Host "$mywd>" -NoNewline -ForegroundColor Green
    return " "
}

function gitUpdate {
	echo "=> Updating from : "
	git config remote.origin.url
	git pull
	if( $osFamily -eq "Linux"){sync}
}


function ex{exit}
function cds($p){if($p -eq "-"){popd} else {pushd $p}}
function cdh{pushd $HOME}
function cd-{popd}
function ..{pushd ..}
function ...{pushd ../..}
function ....{pushd ../../..}
function .....{pushd ../../../..}

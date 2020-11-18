# $HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
#
function osFamily {
#	$platform = [System.Environment]::OSVersion.Platform
	if ($IsWindows -or $env:OS) {
    	$osFamily = "Windows"
	} else {
	    $osFamily = (uname -s)
	}
	return $osFamily
}

$osFamily = (osFamily)

$dirSep = [io.path]::DirectorySeparatorChar

if( $IsWindows ) {
	Set-Alias vi "$env:ProgramFiles/Git/usr/bin/vim.exe"
	Set-Alias  ex
	function ex{exit}

	function dirname($path) { Split-Path -Path $path }
	function basename($path) { $path.split($dirSep)[-1] }
	function cds($p){if($p -eq "-"){popd} else {pushd $p}}
	function cdh{pushd $HOME}
	function cd-{popd}
	function which($command) { (gcm $command).source }
} elseif( $IsLinux ) {
	$PowerShellUserConfigDIR="$HOME/.config/powershell"
} elseif( $IsMacOS ) {
	echo TO BE DONE
}

Import-Alias "$PowerShellUserConfigDIR/seb_${osFamily}_aliases.ps1"

function Prompt {
    $mywd = (pwd).path
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

function ..{pushd ..}
function ...{pushd ../..}
function ....{pushd ../../..}
function .....{pushd ../../../..}

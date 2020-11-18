# $HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
#
function osFamily {
#	$platform = [System.Environment]::OSVersion.Platform
	if ($IsWindows -or $env:OSRelease) {
		$osFamily = "Windows"
	} else {
		$osFamily = (uname -s)
	}
	return $osFamily
}

function osVersion {
	$osBuildNumber = [System.Environment]::OSVersion.Version.Build.ToString() 
	$isWindowsServer = $true # TO BE CALCULATED
	$isWindowsWorkstation = $false # TO BE CALCULATED
	if( $isWindowsServer ) {
		switch( $osBuildNumber ) {
			3790 {$OSRelease = "W2K3"; Break}
			6003 {$OSRelease = "W2K8"; Break}
			7600 {$OSRelease = "W2K8R2"; Break}
			7601 {$OSRelease = "W2K8R2SP1"; Break}
			9200 {$OSRelease = "W2K12"; Break}
			9600 {$OSRelease = "W2K12R2"; Break}
			14393 {$OSRelease = "W2K16v1607"; Break}
			16229 {$OSRelease = "W2K16v1709"; Break}
			default { $OSRelease = "Not Listed"; Break}
		}
	}
	elseif( $isWindowsWorkstation ) {
		switch( $osBuildNumber ) {
			2600 {$OSRelease = "XPSP3"; Break}
			3790 {$OSRelease = "XPPROx64SP2"; Break}
			6002 {$OSRelease = "Vista"; Break}
			7601 {$OSRelease = "7SP1"; Break}
			9200 {$OSRelease = "8"; Break}
			9600 {$OSRelease = "8.1"; Break}
			19042 {$OSRelease = "10"; Break}
			default { $OSRelease = "Not Listed"; Break}
		}
	}
	else {
		$OSRelease = (uname -r)
	}
	return $OSRelease
}

$osFamily = (osFamily)
$OSVersion = (osVersion)

if( $osFamily -eq "Windows" ) { Write-Host "Windows $OSVersion" -foregroundcolor Green }

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
#	$PSHVersion = $PSVersionTable.PSVersion.ToString()
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

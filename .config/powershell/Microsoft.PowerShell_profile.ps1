# $HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
#
function osFamily {
	$platform = [System.Environment]::OSVersion.Platform
	if( !(Test-Path variable:IsWindows) ) {
		# $IsWindows is not defined, let's define it
		$IsWindows = Test-Path env:OS
		if( $platform -eq "Win32NT" ) {
			$osFamily = "Windows"
			$IsLinux = $false
			$IsMacOS = $false
		} elseif( $platform -eq "Unix" ) {
			$osFamily = (uname -s)
			if( $osFamily -eq "Linux" -or $osFamily -eq "Darwin" ) {
				$IsLinux = $osFamily -eq "Linux"
				$IsMacOS = ! $IsLinux
			} else {
				$osFamily = "NOT_SUPPORTED"
				$IsLinux = $false
				$IsMacOS = $false
			}
		} else {
			$osFamily = "NOT_SUPPORTED"
			$IsLinux = $false
			$IsMacOS = $false
		}
		return $IsWindows, $IsLinux, $IsMacOS, $osFamily
	} else {
		#Using PSv>5.1 where these variables are already defined
		if( $IsWindows )   { $osFamily = "Windows" }
		elseif( $IsLinux ) { $osFamily = "Linux" }
		elseif( $IsMacOS ) { $osFamily = "Darwin" }
		else { $osFamily = "NOT_SUPPORTED" }
		return $osFamily
	}
}

function osVersion {
	if( $osFamily -eq "Windows" ) {
		$windowsType = (Get-WmiObject -Class Win32_OperatingSystem).ProductType
		if( $windowsType -eq 1 ) { $isWindowsWorkstation = $true } else { $isWindowsWorkstation = $false }
		$isWindowsServer = !$isWindowsWorkstation

		$osBuildNumber = [System.Environment]::OSVersion.Version.Build.ToString() 
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
		else {
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
	}
	else {
		$OSRelease = (uname -r)
	}
	return $OSRelease
}

if( !(Test-Path variable:IsWindows) ) { $IsWindows, $IsLinux, $IsMacOS, $osFamily = osFamily } else { $osFamily = osFamily }

$OSVersion = (osVersion)

$dirSep = [io.path]::DirectorySeparatorChar
if( $IsWindows ) {
	Set-Alias vi "$env:ProgramFiles/Git/usr/bin/vim.exe"
	if( ! (alias | select-string wget) ) { set-alias wget Invoke-WebRequest }

	Set-Alias  ex
	function ex{exit}

	function dirname($path) { Split-Path -Path $path }
	function basename($path) { $path.split($dirSep)[-1] }
	function cds($p){if($p -eq "-"){popd} else {pushd $p}}
	function cdh{pushd $HOME}
	function cd-{popd}
	function which($command) { (gcm $command).source }
} elseif( $IsLinux ) {
	# TO BE DONE
} elseif( $IsMacOS ) {
	# TO BE DONE
}

$PowerShellUserConfigDIR = Split-Path $PROFILE
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
	if( $IsLinux ){sync}
}

function ..{pushd ..}
function ...{pushd ../..}
function ....{pushd ../../..}
function .....{pushd ../../../..}

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`

    [Security.Principal.WindowsBuiltInRole] "Administrator"))

{

    Write-Warning "You do not have Administrator rights to run this script.`nPlease re-run this script as an Administrator."

    Break

}

Try
{

    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\" -Name "GalleryLocations"

}
Catch
{}

$newValue = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\" -Name 'GalleryLocations' -PropertyType MultiString -Value (
'https://raw.githubusercontent.com/sirredbeard/hyper-v-gallery/master/gallery.json',
'https://download.microsoft.com/download/8/6/7/8675AE2C-30CD-4E3A-834B-BF00EC32F33D/json/en-us/GalleryHyperV.JSON')

$newValue.multistring
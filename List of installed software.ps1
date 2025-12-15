# List installed software from registry (x64 & x86)
$paths = @(
 "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
 "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

Get-ItemProperty -Path $paths -ErrorAction SilentlyContinue |
    Where-Object { $_.DisplayName } |
    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
    Sort-Object DisplayName |
    Format-Table -AutoSize

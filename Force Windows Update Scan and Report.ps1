# Trigger an update scan and list pending updates (requires PS run as admin)
# Uses Windows Update API via COM (works on most client versions)
$Session = New-Object -ComObject "Microsoft.Update.Session"
$Searcher = $Session.CreateUpdateSearcher()
$Searcher.Online = $true

Write-Host "Scanning for updates..."
$Result = $Searcher.Search("IsInstalled=0 and Type='Software'")

Write-Host "Pending updates found: " $Result.Updates.Count
$Result.Updates |
    Select-Object -Property Title, MsrcSeverity, IsDownloaded, IsInstalled |
    Format-Table -AutoSize

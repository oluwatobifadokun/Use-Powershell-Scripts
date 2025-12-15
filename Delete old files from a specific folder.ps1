#Remove any files that are older that 7 days from a specific folder.
$limit = (Get-Date).AddDays(-7)

#Specify the path the files are located
$ThePath = "C:\temp"

Get-ChildItem -Path $ThePath -Recurse | Where-Object { !$_.PSIsContainer -and $_.LastwriteTime -lt $limit } | Remove-Item -Force

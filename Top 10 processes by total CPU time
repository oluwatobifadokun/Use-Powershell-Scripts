# Shows top 10 processes by total CPU time
Get-Process |
    Sort-Object -Property CPU -Descending |
    Select-Object -First 10 -Property Id, ProcessName, CPU |
    Format-Table -AutoSize

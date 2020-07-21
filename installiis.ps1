Install-WindowsFeature -name Web-Server -IncludeManagementTools

$op = "" | select Hostname, IP
$op.Hostname = gwmi Win32_ComputerSystem | select -exp Name
$op.IP = (gwmi Win32_NetworkAdapterConfiguration | ?{$_.IPEnabled} | select -ExpandProperty IpAddress) -join ","
$op | ConvertTo-Html | Out-File "C:\inetpub\wwwroot\Default.htm"

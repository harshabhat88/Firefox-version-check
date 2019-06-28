$array =@() 
$keyname = 'SOFTWARE\\mozilla.org\\Mozilla' 
$computernames = Get-Content C:\Computer.txt 
foreach ($server in $computernames) 
{ 
$reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $server) 
$key = $reg.OpenSubkey($keyname) 
$value = $key.GetValue('CurrentVersion') 
 $obj = New-Object PSObject 
         
        $obj | Add-Member -MemberType NoteProperty -Name "ComputerName" -Value $server 
         
        $obj | Add-Member -MemberType NoteProperty -Name "FireFoxVersion" -Value $value 
 
        $array += $obj  
 
 
} 
 
$array | select ComputerName,FirefoxVersion | export-csv C:\Firefox_Version.csv
function decode64file([string] $aFile)
  {
   try {
	[xml] $xml = Get-Content -Path $aFile
	$decod = [Text.Encoding]::GetEncoding(1251).GetString([Convert]::FromBase64String($xml.lastchild.object))
	if(-not ([string]::IsNullOrWhiteSpace($decod)))
	  {
	   $decod | Out-file $aFile".encode64" -Encoding default
	  }
     }
  catch
     {
      Write-Host $aFile" - bad XML"
     }
  }

$files = dir "C:\bat\ufebsIn"
foreach($file in $files) 
  {
   Write-Host $file.FullName
   decode64file $file.FullName
  }

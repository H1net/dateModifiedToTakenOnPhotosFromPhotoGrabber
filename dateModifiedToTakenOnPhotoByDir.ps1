#$path = Split-Path -parent $MyInvocation.MyCommand.Definition
#$path = "C:\Users\H1net\Desktop\FBPhotoGrabber - Copy"
$path = "C:\Users\H1net\MEDIA\PICTURES\FBPhotoGrabber"

#$exiftool = "C:\exiftool\exiftool-9.48\exiftool.exe"


Function redateFiles 
{ 
  # Loop through all directories 
  $dirs = dir $path -Recurse | Where { $_.psIsContainer -eq $true } 
  $i = 0
  Foreach ($dir In $dirs) 
  { 
    "Dir: $dir"
    
    C:\exiftool\exiftool-9.48\exiftool.exe "-datetimeoriginal<filemodifydate" $dir.FullName
      
    $i++ 
    $percentage =  [Math]::Round($i/$dirs.Length*100, 2)
    "Directory processed ($percentage%)"
  } 
} 


# RUN SCRIPT 
redateFiles 
"SCRIPT FINISHED"

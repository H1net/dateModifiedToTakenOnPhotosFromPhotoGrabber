#$path = Split-Path -parent $MyInvocation.MyCommand.Definition
$path = "C:\Users\H1net\Desktop\FBPhotoGrabber - Copy"
#$path = "C:\Users\H1net\MEDIA\PICTURES\FBPhotoGrabber"
#$exiftool = "C:\exiftool\exiftool-9.48\exiftool.exe"
#exiftool

Function renameFiles 
{ 
  # Loop through all directories 
  $dirs = dir $path -Recurse | Where { $_.psIsContainer -eq $true } 
  Foreach ($dir In $dirs) 
  { 
    "Dir: $dir"
    # Set default value for addition to file name 
    $i = 1 
    $newdir = $dir.name + "_" 
    # Search for the files set in the filter (*.jpg in this case) 
    $files = Get-ChildItem -Path $dir.fullname -Filter *.jpg -Recurse 
    Foreach ($file In $files) 
    { 
      #"Start processing files"
      # Check if a file exists 
      If ($file) 
      { 
        # Split the name and rename it to the parent folder 
        #$split    = $file.name.split(".jpg") 
        #$replace  = $split[0] -Replace $split[0],($newdir + $i + ".jpg") 
        C:\exiftool\exiftool-9.48\exiftool.exe "-datetimeoriginal<filemodifydate" $file.FullName
        
        #"File processed"
        # Trim spaces and rename the file 
        #$image_string = $file.fullname.ToString().Trim() 
        #"$split[0] renamed to $replace" 
        #Rename-Item "$image_string" "$replace" 
        $i++ 
        $percentage = $i/$files.Length
        "Image $file processed ($percentage%)"
      } 
    } 
  } 
} 
# RUN SCRIPT 
renameFiles 
"SCRIPT FINISHED"

#cd "C:\Users\H1net\Desktop\27th Dec - Final Xmas Pics - Copy"

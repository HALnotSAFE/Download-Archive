# Set variables for source and destination folders
$sourceFolder1 = "C:\DLArchive"
$sourceFolder2 = "C:\DLManifest"
$destinationFolder = "S:\IT\Adam Major\Archive"

# Move files from first source folder
Get-ChildItem $sourceFolder1 | Copy-Item -Destination $destinationFolder

# Remove files from first source folder
Get-ChildItem $sourceFolder1 | Remove-Item -Force

# Move files from second source folder
Get-ChildItem $sourceFolder2 | Copy-Item -Destination $destinationFolder

# Remove files from second source folder
Get-ChildItem $sourceFolder2 | Remove-Item -Force

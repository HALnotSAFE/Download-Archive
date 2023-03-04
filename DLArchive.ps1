# Set the path to the Downloads folder
$downloadsPath = "$env:USERPROFILE\Downloads"

# Get the current date and time
$datetime = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Create a new zip file in the Downloads folder
Compress-Archive -Path "$downloadsPath\*" -DestinationPath "$downloadsPath\Downloads-$datetime.zip"

# Move the zip file to the "C:\Download Archive" folder
Move-Item "$downloadsPath\Downloads-$datetime.zip" "C:\DLArchive\"

# Get a list of the files in the zip file
$zipFile = "C:\DLArchive\Downloads-$datetime.zip"
$zip = [System.IO.Compression.ZipFile]::OpenRead($zipFile)
$zipEntries = $zip.Entries

# Create an XML document to store the list of files
$xml = New-Object System.Xml.XmlDocument
$root = $xml.CreateElement("Files")
$xml.AppendChild($root)

# Add each file to the XML document
foreach ($entry in $zipEntries) {
    $file = $xml.CreateElement("File")
    $file.InnerText = $entry.Name
    $root.AppendChild($file)
}

# Save the XML document
$xml.Save("C:\DLManifest\Downloads-$datetime.xml")

# Remove all items from the Downloads folder
Remove-Item "$downloadsPath\*" -Force -Recurse

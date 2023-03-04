# Download-Archive
This is a collection of PS1 files that can be used to automate archiving of a users download folder. I use this script in my job to automate moving my full downloads folder to a separate location, zip the files, and create a manifest.

In order to use this scirpt, you'll need to download both PS1 files. First, run the DestinationMake.PS1 file. This will create two directories under the C:\ drive; C:\DLManifest and C:\DLArchive.

Next, the DLArchive.PS1 file can either be ran or added to Task Scheduler to automate zipping of the downloads folder: 
Open the Task Scheduler by searching for it in the Start menu or by running "taskschd.msc" in the Run dialog (Windows key + R).
Click on "Create Basic Task" in the right-hand pane.
Give the task a name and description, then click Next.
Select "Weekly" as the trigger and specify the day of the week and time you want the script to run. Click Next.
Select "Start a program" as the action and click Next.
In the Program/script field, enter the full path to the PowerShell executable, which is typically "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe".
In the Add arguments (optional) field, enter the full path to the script file, along with any parameters that you want to pass to it. For example, if the script is located at "C:\Scripts\MyScript.ps1" and you want to pass the parameter "-Verbose", you would enter "-File C:\Scripts\MyScript.ps1 -Verbose"
Click Next.
Review the settings and click Finish.

Why is this a script? 
In my day job, I receive an abundance of files from vendors that I need to keep. Instead of manually moving these files out of my downloads folder, this script will zip all of the files in my downloads folder up, creates a xml manifest of what contents are in the zip file, and moves both files to their respective folders. I do have another script that is scheduled out in Task Scheduler to move the files from my local system to an archive folder on a file share. 

#Evernote-Transcript.ps1

_Parameters_

-Notebook _The name of the notebook to save a note too_
-Title _The title of the Note_
-Tag _The tag which to apply to the Note_
-Transcript _The Transcript (or any file) you wish to append to the Note_

#Usage

_Example_
```powershell
$args = @{

        'NoteBook' = "Powershell Transcripts"
        "Title" = "Testing from my Function"
        "Tag" = "Powershell"
        #Get the last log stored
        "Transcript" = "$((Get-ChildItem C:\Temp\PSLogs | Sort-Object LastWriteTime | Select-Object -Last 1).FullName)"

        }

New-EvernoteNoteFromTranscript @args
```
Function New-EvernoteNoteFromTranscript {
    <#
        .SYNOPSIS
        Create an Evernote Note in a Notebook from your Powershell Transcript

        .PARAMETER Notebook
        The Evernote Notebook to add too

        .PARAMETER Title
        The title of the Note

        .PARAMETER Tag
        The Tag which to tag the Note with

        .PARAMETER Transcript
        The Transcript File with which to use

        .EXAMPLE
        $args = @{

        'NoteBook' = "Powershell Transcripts"
        "Title" = "Testing from my Function"
        "Tag" = "Powershell"
        #Get the last log stored
        "Transcript" = "$((Get-ChildItem C:\Temp\PSLogs | Sort-Object LastWriteTime | Select-Object -Last 1).FullName)"

        }

        New-EvernoteNoteFromTranscript @args

    #>
    [cmdletBinding()]
    Param(
    [Parameter(Mandatory,Position =0,ParameterSetName='EvernoteArgs')]
    [string]$Notebook,
    [Parameter(Mandatory,Position= 1,ParameterSetName='EvernoteArgs')]
    [string]$Title,
    [Parameter(Mandatory,Position=2,ParameterSetName='EvernoteArgs')]
    [string]$Tag,
    [Parameter(Mandatory,Position=3,ParameterSetName='EvernoteArgs')]
    [string]$transcript
    )

    $enScript = "C:\Program Files (x86)\Evernote\Evernote\ENScript.exe"
    Start-Process $enScript  "createnote /s ""$Transcript"" /n ""$Notebook"" /i ""$Title"" /t ""$Tag""" -WindowStyle Hidden

}

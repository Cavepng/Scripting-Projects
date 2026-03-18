'*************************************************************************
'Script Name: wk4 computer analyzer.vbs
'Author: mh
'Created: 02/25/2026
'Description: This script demonstrates how to access environment
'variables using the WSH
'*************************************************************************
'Force the explicit declaration of all variables used in this script
Option Explicit
'Create a variable to store the name of the wolf
Dim objWshObject
'Set up an instance of the WScript.WshShell object
Set objWshObject = WScript.CreateObject("WScript.Shell")
'Use the WScript.Shell object’s ExpandEnvironmentStrings() method to view
'environment variables
MsgBox "This computer is running a version of " & _
    objWshObject.ExpandEnvironmentStrings("%OS%") & vbCrLf & _
    "and has " & _
    objWshObject.ExpandEnvironmentStrings("%NUMBER_OF_PROCESSORS%") & _
    " processor(s)."
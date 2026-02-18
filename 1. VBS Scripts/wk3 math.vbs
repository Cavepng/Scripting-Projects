'*******************************************************
' Script Name: Math Game
' Author: Micah Hibbard
' Created: 2/11/2026
' Description: Quizes user, validates input, and opens   
'              Wordpad if they guess the wrong number.
'*******************************************************


' Initialize the script
Option Explicit
Dim WshShl, QuestionOne, ProveIt
' Define the titlebar message for the popup box
Const cTitlebarMsg = "The Math Game"
' Instantiate an instance of the WshShl object.
Set WshShl = WScript.CreateObject("WScript.Shell")


' Processing Section
QuestionOne = InputBox("What is the sum of 1+5*9/3 ?", cTitlebarMsg)

' Was answer provided?
If Len(QuestionOne) = 0 Then
    MsgBox "Sorry, you must enter a number"
    WScript.Quit
End If

' Is the answer a number?
If IsNumeric(QuestionOne) <> True Then
    MsgBox "You must enter a number."
    WScript.Quit
End If

' Was answer correct?
If QuestionOne = 16 Then
    MsgBox "Congrats, you're smart."
Else
    ProveIt = MsgBox("Incorrect, do you want to see me solve the " & _ 
    "equation?", 36, cTitlebarMsg)
    If ProveIt = vbYes Then 
        ' Execute wordpad section if player would like to see the correct solution.
        ' Please note: Wordpad is deprecated and may not be available on all Windows versions.
        WshShl.Run "wordpad"
        WScript.Sleep 5000
        WshShl.SendKeys "Use the correct order of operations to solve the math problem."
        WScript.Sleep 1000
        WshShl.SendKeys "{ENTER}"
        WshShl.SendKeys "  1. Working from right to left multiple 5 * 9."
        Wscript.Sleep 1000
        WshShl.SendKeys "{ENTER}"
        WshShl.SendKeys "  2. Divide results by 3."
        Wscript.Sleep 1000
        WshShl.SendKeys "{ENTER}"
        WshShl.SendKeys "  3. Add 1 to the results."
        Wscript.Sleep 1000
        WshShl.SendKeys "{ENTER}"
        WshShl.SendKeys "Done answer is 16."
        WScript.Sleep 4000
        WshShl.SendKeys "{ENTER}{ENTER}{ENTER}"
        WshShl.SendKeys "Closing application"
        WScript.Sleep 500
        WshShl.SendKeys "."
        WScript.Sleep 500
        WshShl.SendKeys "."
        WScript.Sleep 500
        WshShl.SendKeys "."
        WScript.Sleep 500

        ' Close the focused window.
        WshShl.SendKeys "%{F4}"
        WshShl.SendKeys "%{N}"
        WScript.Sleep 2000

        'Computes the answer in the Windows calculator application.
        WshShl.Run "Calc"
        WScript.Sleep 1000
        WshShl.SendKeys 5 & "{*}"
        WScript.Sleep 2000
        WshShl.SendKeys 9
        WScript.Sleep 2000
        WshShl.SendKeys "{ENTER}"
        WScript.Sleep 2000
        WshShl.SendKeys "{/}" & 3
        WScript.Sleep 2000
        WshShl.SendKeys "{ENTER}"
        WScript.Sleep 2000
        WshShl.SendKeys "{+}" & 1
        WScript.Sleep 2000
        WshShl.SendKeys "{ENTER}"
        WScript.Sleep 3000
        WshShl.SendKeys "%{F4}"
        MsgBox("Done!")
    End If
End If
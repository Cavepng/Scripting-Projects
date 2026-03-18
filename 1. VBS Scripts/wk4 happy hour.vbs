'Happy Hour Script
' Page 87
' todays date = weekdate function, use different function around the date. month is a function.
'*************************************************************************
'Script Name: HappyHour.vbs
'Author: Jerry Ford
'Created: 01/28/14
'Description: This script tells the user if it’s Friday
'*************************************************************************

'Perform script initialization activities
Dim TodaysDate

' Weekday is a VBScript function that returns the day of the week
TodaysDate = WeekdayName(Weekday(Date)) 

' demonstrate time formatting
Dim currentTime, formattedTime
currentTime = Time  ' now's time portion
' use built‑in short time style (typically hh:mm AM/PM)
formattedTime = FormatDateTime(currentTime, vbShortTime)
' alternatively you can build your own string:
'    formattedTime = Right("0" & Hour(currentTime),2) & ":" & _
'                    Right("0" & Minute(currentTime),2) & _
'                    IIf(Hour(currentTime) < 12, " AM", " PM")

If TodaysDate = vbFriday then 
    MsgBox "Hurray, it is Friday. Time to get ready for happy hour!" & vbCrLf & _
           "Current time: " & formattedTime
    WScript.Quit
Else
    MsgBox "No happy hour. It's " & TodaysDate & " today." & vbCrLf & _
           "Current time: " & formattedTime
End If

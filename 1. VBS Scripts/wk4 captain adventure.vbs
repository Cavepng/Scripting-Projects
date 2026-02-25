Option Explicit

' --- CONFIGURATION ---
Dim apiKey, model, userPrompt
apiKey = "AIzaSyA9asClILg2dCD-4rQmeNz6fWqnDHYGRXk"
model  = "gemini-3-flash-preview"

' --- GET USER INPUT ---
userPrompt = InputBox("Enter your prompt:", "Gemini AI Assistant")
If userPrompt = "" Then WScript.Quit

' --- CALL THE API ---
Dim url, requestBody, http, responseJSON
url = "[https://generativelanguage.googleapis.com/v1beta/models/](https://generativelanguage.googleapis.com/v1beta/models/)" & model & ":generateContent?key=" & apiKey

' Correctly escaped JSON for VBScript
requestBody = "{""contents"": [{""parts"":[{""text"": """ & userPrompt & """}]}]}"

Set http = CreateObject("MSXML2.ServerXMLHTTP.6.0")
http.Open "POST", url, False
http.SetRequestHeader "Content-Type", "application/json"

On Error Resume Next
http.Send requestBody

' Check for network-level errors
If Err.Number <> 0 Then
    MsgBox "Network Error: " & Err.Description, 16, "Fatal Error"
    WScript.Quit
End If
On Error GoTo 0

responseJSON = http.ResponseText

' --- THE PARSER ---
Dim html, window, result
Set html = CreateObject("htmlfile")
Set window = html.parentWindow

' JavaScript helper to handle Gemini's specific JSON structure
window.execScript "function getGeminiText(jsonStr) { " & _
    "  try { " & _
    "    var obj = JSON.parse(jsonStr); " & _
    "    if (obj.error) { return 'API_ERROR: ' + obj.error.message; } " & _
    "    var txt = obj.candidates[0].content.parts[0].text; " & _
    "    return txt.replace(/```json|```/g, '').trim(); " & _
    "  } catch(e) { return 'PARSE_FAIL: ' + e.message; } " & _
    "}", "JScript"

result = window.getGeminiText(responseJSON)

' --- SMART OUTPUT ---
If Left(result, 10) = "API_ERROR:" Then
    MsgBox "Google API returned an error:" & vbCrLf & vbCrLf & Mid(result, 11), 16, "Gemini API Error"
ElseIf Left(result, 11) = "PARSE_FAIL:" Then
    ' This is where your previous error happened. Let's see the raw data now.
    Dim seeRaw
    seeRaw = MsgBox("Parsing failed. Would you like to see the raw response for debugging?", 36, "Debug Info")
    If seeRaw = 6 Then 
        ' Create a temporary file to show long JSON responses
        Dim fso, tempFile
        Set fso = CreateObject("Scripting.FileSystemObject")
        tempFile = fso.GetSpecialFolder(2) & "\gemini_debug.txt"
        fso.CreateTextFile(tempFile, True).Write(responseJSON)
        CreateObject("WScript.Shell").Run "notepad.exe " & tempFile
    End If
Else
    ' SUCCESS! Show the clean text.
    MsgBox result, 64, "Gemini Response"
End If
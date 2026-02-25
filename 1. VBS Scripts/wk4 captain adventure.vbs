'*************************************************************************
'Script Name: Captain Adventure.vbs
'Author: MH
'Created: 02/25/2026
'Description: This script prompts the user to answer a number of questions
'and then uses Gemini API to create a story based on the responces.
'*************************************************************************

'Section 1: Set up
Option Explicit

Const cGameTitle = "Captain Adventure"
Const cApiKey = "INSERT_GEMINI_API_KEY"
Const cApiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent?key="


Dim strName, strVacation, strObject, strFriend, strFood, strStory
Dim strSystemPrompt, strUserInput, strUserPrompt, strJsonResponse

If cApiKey = "" Then
    MsgBox("Please input your Gemini API key.")
    WScript.Quit
ElseIf cApiKey = "INSERT_GEMINI_API_KEY" Then
    MsgBox("Please replace INSERT_GEMINI_API_KEY with your Gemini API key.")
    WScript.Quit
Else

'Section 2: Inputs
strName = InputBox("What's your name?", cGameTitle, "John")
strVacation = InputBox("Ideal vacation destination", cGameTitle, "Chicago")
strObject = InputBox("Name a strange object.", cGameTitle, "obelisk")
strFriend = InputBox("Who is your best friend?", cGameTitle, "Jane")
strFood = InputBox("What's your favorite food?", cGameTitle, "pizza")

strUserPrompt = InputBox("What should the Madlib be based on?", cGameTitle, "College")
'Section 3: Simplified AI Logic
strSystemPrompt = "You are a creative storyteller. Write a 5-sentence adventure story about Captain Adventure. Use the following details: Name, Vacation Spot, Strange Object, Friend, and Favorite Food. Base the story off of the Madlib Theme. Return ONLY the story text. Do not include any code or markdown."

' Combine the user's answers and the theme into one single string
strUserInput = "Name: " & strName & ", Vacation: " & strVacation & ", Object: " & strObject & ", Friend: " & strFriend & ", Food: " & strFood & " | Theme: " & strUserPrompt

' Now we only send TWO arguments, matching what the function expects
strStory = CallGemini(strSystemPrompt, strUserInput)

If strStory = "" Then
    strStory = "The Oracle is unavailable. Please check your API key."
End If

'Display the story
MsgBox strStory, vbOkOnly + vbExclamation, cGameTitle

'--- THE ERROR-FREE HELPER ---

Function CallGemini(sys, user)
    Dim objHTTP, strPayload, resp, clean
    
    'We still clean quotes from the input just to be safe with the JSON structure
    Dim safeSys: safeSys = Replace(sys, Chr(34), "\""")
    Dim safeUser: safeUser = Replace(user, Chr(34), "\""")

    strPayload = "{" & Chr(34) & "system_instruction" & Chr(34) & ": {" & Chr(34) & "parts" & Chr(34) & ":{" & Chr(34) & "text" & Chr(34) & ": " & Chr(34) & safeSys & Chr(34) & "}}," & _
                 Chr(34) & "contents" & Chr(34) & ": [{" & Chr(34) & "parts" & Chr(34) & ":[{" & Chr(34) & "text" & Chr(34) & ": " & Chr(34) & safeUser & Chr(34) & "}]}]}"

    Set objHTTP = CreateObject("MSXML2.XMLHTTP")
    objHTTP.Open "POST", cApiUrl & cApiKey, False
    objHTTP.SetRequestHeader "Content-Type", "application/json"
    
    On Error Resume Next
    objHTTP.Send strPayload
    
    If objHTTP.Status = 200 Then
        resp = objHTTP.ResponseText
        'Extract just the text result
        clean = Split(Split(resp, Chr(34) & "text" & Chr(34) & ": " & Chr(34))(1), Chr(34))(0)
        'Clean up newlines so the MsgBox looks nice
        clean = Replace(clean, "\n", vbCrLf)
        CallGemini = clean
    Else
        CallGemini = ""
    End If
End Function
End If
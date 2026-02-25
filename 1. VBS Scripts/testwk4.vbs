'*************************************************************************
'Script Name: Captain Adventure.vbs
'Author: MH
'Created: 02/25/2026
'Description: This script prompts the user to answer a number of questions
'and then uses the answers to create a comical action adventure story.
'*************************************************************************

'Section 1: Set up
Option Explicit

Const cGameTitle = "Captain Adventure"

'Stores welcome message
Dim strWelcomeMsg

'Stores data that is inputted from users
Dim strName, strVacation, strObject, strFriend, strFood

'Outputs story
Dim strStory


'Section 2: Splash Screen

strWelcomeMsg = "Welcome to the story of ..." & vbCrLf & "CAPTAIN ADVENTURE"
MsgBox strWelcomeMsg, vbOkOnly + vbExclamation, cGameTitle

strName = InputBox("What's your name?", cGameTitle, "John")

strVacation = InputBox("Ideal vacation destination", cGameTitle, "Chicago")

strObject = InputBox("Name a strange object.", cGameTitle, "obelisk")

strFriend= InputBox("Who is your best friend?", cGameTitle, "Jane")

strFood = InputBox("What's your favorite food?", cGameTitle, "pizza")


strStory = "Once upon a time ........... " & strName & " went on vacation in the far away land of " & strVacation & ". A local tour guide suggested cave exploration. While in the cave " & strName & " accidentally became separated from the rest of the tour group and stumbled into a part of the cave never visited before. It was completely dark. Suddenly a powerful light began to glow. " & strName & " saw that it came from a mysterious " & strObject & " located in the far corner of the cave room. " & strName & " picked it up and a flash of light occurred and " & strName & " was instantly transported to a far away world. There in front of him was " & strFriend & ", the ancient God of the legendary cave people. " & strFriend & " explained to " & strName & " that destiny had selected him to become Captain Adventure! He was then returned to Earth and told to purchase a Winnebago and travel the countryside looking for people in need of help. To activate the superpowers bestowed by " & strFriend & " all that " & strName & " had to do was pick up the " & strObject & " and say """ & strFood & """ three times in a row. The End"
'Display the story
MsgBox strStory, vbOkOnly + vbExclamation, cGameTitle
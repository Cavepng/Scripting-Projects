' 1. Define the resources used by this script.
' 2. Display the game’s instructions.
' 3. Provide a way for the user to select a choice.
' 43Chapter 2 • An Introduction to the Windows Script Host
' 4. Devise a way for the script to generate a random number.
' 5. Assign the computer’s choice based on the script’s randomly selected number.
' 6. Display the final results of the game

' Declare variables before use
Dim WshShl, Answer, CardImage, IntAnswer

'Get objects from core model 
Set WshShl = WScript.CreateObject("WScript.Shell")

' Popup box with explanation
WshShl.Popup "Welcome to Rock, Paper Scissors. " & _
    "Here are the rules: " & _
    "rock beats scissors, " & _
    "sissors beats paper, " & _
    "paper beats rock. " & _
    "You win if you beat the computer, you lose if the computer beats you, and you tie if you both have the same guess."

' Gets input from player and store it in InputBox
Answer = InputBox("Type Rock, Paper, or Scissors.")

'Gets random number.
Randomize
GetRandomNumber = Int((3 * Rnd()) + 1)

'Assigns number based on intiger. 
If GetRandomNumber = 1 then CardImage = "Rock"
If GetRandomNumber = 2 then CardImage = "Paper"
If GetRandomNumber = 3 then CardImage = "Scissors"

If Answer = "Rock" then IntAnswer = "1"
If Answer = "Paper" then IntAnswer = "2"
If Answer = "Scissors" then IntAnswer = "3"
If LCase(Answer) <> "rock" And LCase(Answer) <> "paper" And LCase(Answer) <> "scissors" then WshShl.Popup " Input error try again."


'Results
'I searched how to get a new line because i did not want 12 spaces.
WshShl.Popup "You Picked: " & Answer  & vbCrLf & _
    "Computer picked: " & CardImage

' Use if statements to account for all possible outcomes. there is without a doubt a much better way to do this.
' I could have also compared text instead of inigers to make it easier to read.
If CardImage = "Rock" And IntAnswer = "1" then msgbox("You tied!")
If CardImage = "Paper" And IntAnswer = "2" then msgbox("You tied!")
If CardImage = "Scissors" And IntAnswer = "3" then msgbox("You tied!")

If CardImage = "Rock" And IntAnswer = "2" then msgbox("Player wins!")
If CardImage = "Rock" And IntAnswer = "3" then msgbox("Computer wins!")

If CardImage = "Paper" And IntAnswer = "1" then msgbox("Computer wins!")
If CardImage = "Paper" And IntAnswer = "3" then msgbox("Player wins!")

If CardImage = "Scissors" And IntAnswer = "1" then msgbox("Player wins!")
If CardImage = "Scissors" And IntAnswer = "2" then msgbox("Computer wins!")

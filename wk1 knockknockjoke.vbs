Name = InputBox("What's your name?")
Reply1 = InputBox ("Hi " & Name & ". Knock knock!")
If Reply1 = "Who's there?" Then
    Reply2 = InputBox("Orange")
    If Reply2 = "Orange who?" Then 
        msgbox("Orange you glad to see me?")
    End If
    If Reply2 <> "Orange who?" Then msgbox("Input error, try again.")
End If
If Reply1 <> "Who's there?" Then msgbox("Input error, try again.")
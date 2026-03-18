'math demo.vbs

dim intFirstNumber, intSecondNumber, intTotal

intFirstNumber = InputBox("Enter the first number:")
intSecondNumber = InputBox("Enter the second number:")

intTotal = CDbl(intFirstNumber) + CDbl(intSecondNumber)

MsgBox "The total is: " & intTotal & vbCrLf & "The first number is: "
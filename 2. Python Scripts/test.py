##### TEST SCRIPT.
#Get user input and convert it to int.
x = int(input("Pick \"1\" if you want to win.\nPick \"2\" if you would like to lose: "))
#If else stuff. 
if x == 1:
    print(f"You picked \"{x}\".\nYou Won!")
elif x== 2:
    print(f"You picked \"{x}\".\nYou Lost.")
else:
    print("Invalid input. You lost!")
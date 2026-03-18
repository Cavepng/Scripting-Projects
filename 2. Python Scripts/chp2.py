#Useless trivia
name = input("What is your name? ")

age = input("How old are you? ")
age =int(age)

weight = input("How much do you weigh? ")
weight = int(weight)

print("\nYour name in lowercase is ", name.lower())
print("\nYour name in UPPERCASE is ", name.upper())

called = name * 5
print("\nIf a small kid was trying to get your attention then your name would become: ")
print(called)

seconds = age * 365 * 24 * 60 * 60
print("\nYou're over ", seconds, " seconds old")

moon_weight = weight * 0.165
print("\nOn the moon you would only weigh ", moon_weight, "pounds.")

sun_weight = weight * 27.1
print("\nOn the sun, you'd weigh", sun_weight, "(but not for long).")

input("\n\nPress the enter key to exit.")

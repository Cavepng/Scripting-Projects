# Word Jukmble

import random

WORDS = ("python", "jumble", "easy", "difficult", "answer", "xylophone")

word = random.choice(WORDS)
correct = word

jumble = ""
while word:
    position = random.randrange(len(word))
    jumble += word[position]
    word = word[:position] + word[(position + 1):]

print("""
        Welcome to Word Jumble!
    Unscramble the letters to make a word.
    (Press the enter key at the prompt to quit)
""")

print("the jumble is: ", jumble)

# Game loop to allow replaying
play_again = True
while play_again:
    guess = input("Your guess: ")
    guess = guess.lower()
    while (guess != correct) and (guess != ""):
        print("Sorry, that's not it.")
        guess = input("Your guess: ")
        guess = guess.lower()
    
    if guess == correct:
        print("\nCorrect answer!\n")
    
    print("Thanks for playing.")
    print("""
        Play again? (1)
        Quit? (2)
    """)
    choice = input("Enter your choice: ")
    
    if choice == "1":
        play_again = True
    else:
        play_again = False
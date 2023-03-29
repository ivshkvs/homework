import random

while True:

    # Generate random number
    secret_number = random.randint(1, 100)

    # Start guessing
    while True:
        # Ask user for number
        guess = int(input("Guess number from 1 to 100: "))

        # Check if user guessed number
        if guess == secret_number:
            print("Congratulations, you guessed number")
            break
        elif guess < secret_number:
            print("Hidden number greater")
        else:
            print("Hidden number less")

    # Ask user if he wants continue playing
    play_again = input("Do you want to play again?: (yes/no): ")
    if play_again.lower() != "yes":
        break

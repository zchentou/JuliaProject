using Random

# Mad Libs in Julia
# Source: https://github.com/logankilpatrick/10-Julia-Projects-for-Beginners
function play_mad_libs()

    print("Enter a verb (action): ")
    verb1 = readline()

    print("Enter an adjective (descriptive word): ")
    adj1 = readline()

    print("Enter a noun (person place or thing): ")
    noun1 = readline()

    print("Enter another noun (person place or thing): ")
    noun2 = readline()

    print("Enter a catchphrase (something like 'hands up!'): ")
    phrase1 = readline()
    
    base_sentence = "John $verb1 down the street one night, playing with his $adj1 $noun1. When all of a /
    sudden, a $noun2 jumped out at him and said $phrase1"
    print("\n\n", base_sentence)
end


# Number Guessing Game in Julia
# Source: https://github.com/logankilpatrick/10-Julia-Projects-for-Beginners
function play_number_guess_human()

    total_numbers = 25 # 

    # Generate a random number within a certain range
    target_number = rand(1:total_numbers)
    guess = 0

    # While the number has not been guessed, keep prompting for guesses
    while guess != target_number
        print("Please guess a number between 1 and $total_numbers: ")
        guess = parse(Int64, readline())
        # Convert the string value input to a number

        # If we are within +/-2 of the target, give a hint
        if abs(target_number - guess) <= 2 && target_number != guess
            print("\nYou are getting closer!\n")
        end
    end

    print("Nice job, you got it!")
end


# Computer Number Guessing Game in Julia
# Source: https://github.com/logankilpatrick/10-Julia-Projects-for-Beginners
function play_number_guess_computer()

    print("Please enter a number between 1 and 50 for the computer to try and guess: ")
    
    # Take in the user input and convert it to a number
    target_number = parse(Int64, readline())
    
    # Create an array of 50 numbers
    guess_order = collect(1:50)
    
    # Define our random seed
    rng = MersenneTwister(1234)

    # Shuffle the array randomly given ur seed
    shuffled_guess = shuffle(rng, guess_order)

    # Loop through each guess and see if it right
    for guess in shuffled_guess

        if guess == target_number
            print("\nThe computer cracked the code and guessed it right!")
            break # Stop the for loop if we get it right
        end
        
        print("\nComputer guessed: $guess")
    end
end

# Rock 🗿, Paper 📃, Scissors ✂️ Game in Julia
function play_rock_paper_scissors()
    moves = ["🗿", "📃", "✂️"]
    computer_move = moves[rand(1:3)]

    # Base.prompt is similar to readline which we used before
    human_move = Base.prompt("Please enter 🗿, 📃, or ✂️")
    # Appends a ": " to the end of the line by default

    print("Rock...")
    sleep(0.8)

    print("Paper...")
    sleep(0.8)

    print("Scissors...")
    sleep(0.8)
    
    print("Shoot!\n")

    if computer_move == human_move
        print("You tied, please try again")
    elseif computer_move == "🗿" && human_move == "✂️"
        print("You lose, the computer won with 🗿, please try again")
    elseif computer_move == "📃" && human_move == "🗿"
        print("You lose, the computer won with 📃, please try again")
    elseif computer_move == "✂️" && human_move == "📃"
        print("You lose, the computer won with ✂️, please try again")
    else
        print("You won, the computer lost with $computer_move, nice work!")
    end

end

using ProgressBars
using Random

# Generate Passwords in Julia
# Source: https://github.com/logankilpatrick/10-Julia-Projects-for-Beginners
# WARNING: Do not use this code to generate actual passwords!
function generate_passwords()
    num_passwords = parse(Int64, Base.prompt("How many passwords do you want to generate?"))
    password_length = parse(Int64, Base.prompt("How long should each password be?"))

    # Create an empty vector / array
    password_holder = []

    # Generate a progress bar to show how close we are to being done
    for i in ProgressBar(1:num_passwords)
        # Add the new password into the password holder
        push!(password_holder, randstring(password_length))
        sleep(0.2) # Manually slowdown the generation of passwords
    end
    
    # Only show the passwords if there are less than 100
    if length(password_holder) <= 100
        # Loop through each password one by one
        for password in password_holder
            print("\n", password)
        end
    end
end

play_mad_libs()
play_number_guess_human()
play_number_guess_computer()
play_rock_paper_scissors()
# generate_passwords()
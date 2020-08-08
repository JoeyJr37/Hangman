require_relative './game'
require_relative './functions'

class Hangman
    include Functions

    def new_game
        puts "Welcome to Hangman! Here are the rules: "
            # "AI will select a random word between 5 and 12 letters."
            # "At the beginning of each turn you will have the option to save your game."
            # "If you enter 'no' then you can choose a letter. If the letter is included in the random word, great job!"
            # "If the letter is not in the random word then you will lose a turn."
            # "You start with 8 turns (or 8 opportunities for wrong letters)."
            # "The game is over when either you have guessed 8 wrong letters, or you guess the random word."
            # "Have fun!"
        puts "What should I call you?"
        name = gets.chomp
        puts "Welcome #{name.capitalize}!"
        random_word = Dictionary.new.get_word
        player = User.new(name, random_word)
        new_game = Game.new(player)
        puts "Selecting the secret word..."
        p player.player_word_array
        new_game.obtain_new_guess
    end

    def run_game
        puts "Would you like to load a saved game?"
        answer = gets.chomp.downcase
        if answer == 'yes'
            puts "Please enter your unique ID: "
            answer = gets.chomp
            saved_game = Game.new(Functions.load_a_saved_game(answer))
            saved_game.print_saved_game_state
            saved_game.obtain_new_guess
        else
            new_game
        end
    end
end

Hangman.new.run_game


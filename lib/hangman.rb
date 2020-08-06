require_relative './game'
require_relative './functions'

class Hangman
    include Functions

    def new_game
        puts "Welcome to Hangman! Here are the rules: "
            # some rules here
            # 
            #
            #
        puts "What should I call you?"
        name = gets.chomp
        puts "Welcome #{name.capitalize}!"
        random_word = Dictionary.new.get_word
        player = User.new(name, random_word)
        p player
        # new_game = Game.new(random_word, player)
        # puts "Selecting the secret word..."
        # p player.player_word_array
        # new_game.obtain_new_guess
    end

    def run_game
        puts "Would you like to load a saved game?"
        answer = gets.chomp.downcase
        if answer == 'yes'
            puts "Please enter your unique ID: "
            answer = gets.chomp
            saved_game = Functions.load_a_saved_game(answer)
            saved_game.obtain_new_guess
        else
            new_game
        end
    end
end

Hangman.new.run_game


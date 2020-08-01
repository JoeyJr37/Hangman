require_relative './dictionary.rb'
require_relative './user.rb'
require 'date'

class Game
    attr_accessor :player, :random_word, :incorrect_guesses_array

    def initialize(player)
        @random_word = Dictionary.new.get_word
        @player = User.new(player, random_word)
        @incorrect_guesses_array = []
    end

    def game_over?
        if random_word == player.player_word_array.join("")
            puts "You win! The word was #{random_word}."
        else
            obtain_new_guess
        end
    end

    def is_letter_in_random_word?(guess)
        if random_word.include?(guess)
            random_word.split("").each_with_index do |letter, index|
                player.player_word_array[index] = guess if letter == guess end
            puts "Great job! #{guess} is in the secret word!"
            p player.player_word_array
            game_over?
        else
            incorrect_guesses_array.push(guess)
            puts "Wrong! #{player.turns_left - 1} turns left! 
            Incorrect guesses: #{incorrect_guesses_array}
            #{player.player_word_array}"
            player.decrease_turn_count
            obtain_new_guess
        end
    end

    def obtain_new_guess
        puts "Would you like to save your game?"
        answer = gets.chomp.downcase
        if answer == 'yes'
            save_the_game
        else
            puts "Please guess a letter."
            guess = gets.chomp.downcase
            is_letter_in_random_word?(guess)
        end
    end

    def save_the_game
        Dir.mkdir("saved_games") unless Dir.exists? "saved_games"
        filename = "saved_games/#{player.name} #{DateTime.now}"
        gamelogs = [random_word, player.name, player.player_word_array, player.turns_left]
        File.open(filename, 'w') do |file|
            file.puts gamelogs
        end
    end

    def load_a_saved_game
        puts "Welcome back!"

    end

    def run_game
        puts "Would you like to load a saved game?"
        answer = gets.chomp.downcase
        if answer == 'yes'
            load_a_saved_game
        else
            puts "Welcome to Hangman! Here are the rules: "
                # some rules here
            puts "What should I call you?"
            name = gets.chomp
            puts "Welcome #{name.capitalize}!"
            puts "Selecting the secret word..."
            puts "The secret word has #{random_word.length} letters in it."
            p player.player_word_array
            obtain_new_guess
    end
end
require_relative './dictionary.rb'
require_relative './user.rb'
require_relative './functions.rb'
require 'date'
require 'json'

class Game
    include Functions
    attr_accessor :player, :name, :random_word, :incorrect_guesses_array, :player_word_array, :unique_id, :turns_left, :decrease_turn_count

    def initialize(random_word, player)
        @random_word = random_word
        @player = player
        @name = player.name
        @player_word_array = player.player_word_array
        @incorrect_guesses_array = player.incorrect_guesses_array
        @unique_id = player.unique_id
        @turns_left = player.turns_left
        @decrease_turn_count = player.decrease_turn_count
    end

    def game_over?
        if random_word == player_word_array.join("")
            puts "You win! The word was #{random_word}."
        else
            obtain_new_guess
        end
    end

    def is_letter_in_random_word?(guess)
        if random_word.downcase.include?(guess)
            random_word.split("").each_with_index do |letter, index|
                player_word_array[index] = guess.downcase if letter == guess.downcase end
            puts "Great job! #{guess} is in the secret word!"
            p player_word_array
            game_over?
        else
            incorrect_guesses_array.push(guess)
            puts "Wrong! #{turns_left - 1} turns left! 
            Incorrect guesses: #{incorrect_guesses_array}
            #{player_word_array}"
            decrease_turn_count
            obtain_new_guess
        end
    end

    def obtain_new_guess
        puts "Would you like to save your game?"
        answer = gets.chomp.downcase
        if answer == 'yes'
            Functions.save_the_game(player, random_word)
        else
            puts "Please guess a letter."
            guess = gets.chomp.downcase
            is_letter_in_random_word?(guess)
        end
    end
end
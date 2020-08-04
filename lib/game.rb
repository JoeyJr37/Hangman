require_relative './dictionary.rb'
require_relative './user.rb'
require_relative './functions.rb'
require 'date'
require 'json'

class Game
    include Functions
    attr_accessor :player, :random_word, :incorrect_guesses_array, :player_word_array

    def initialize(random_word, name, player_word_array, incorrect_guesses_array, unique_id, turns_left)
        @name = name
        @random_word = random_word
        @player_word_array = player_word_array
        @incorrect_guesses_array = incorrect_guesses_array
        @unique_id = unique_id
        @turns_left = turns_left
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
                player_word_array[index] = guess if letter == guess end
            puts "Great job! #{guess} is in the secret word!"
            p player_word_array
            game_over?
        else
            incorrect_guesses_array.push(guess)
            puts "Wrong! #{turns_left - 1} turns left! 
            Incorrect guesses: #{incorrect_guesses_array}
            #{player_word_array}"
            player.decrease_turn_count
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
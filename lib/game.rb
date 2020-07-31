require_relative './dictionary.rb'
require_relative './user.rb'

class Game
    attr_accessor :player, :random_word, :incorrect_guesses_array

    def initialize(player)
        @random_word = Dictionary.new.get_word
        @player = User.new(player, random_word)
        @incorrect_guesses_array = []
    end

    def is_letter_in_random_word?(guess)
        if random_word.include?(guess)
            # find all instances of the guessed letter in the random word
            # find all the index numbers for where the letters are located in the random word
            # replace the dashes in the player array at those same index numbers with the guessed letter
            player.player_word_array[random_word.index(guess)] = guess
            puts "Great job! #{guess} is in the secret word!"
            p player.player_word_array
            if random_word == player.player_word_array
                puts "You win!"
            else
                obtain_new_guess
            end
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
        puts "Please guess a letter."
        guess = gets.chomp
        is_letter_in_random_word?(guess)
    end

    def save_the_game
        #code
    end

    def load_a_saved_game
        #code
    end

    def run_game
        puts "The secret word has #{random_word.length} letters in it."
        p player.player_word_array
        obtain_new_guess
    end
end
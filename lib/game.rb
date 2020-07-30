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
            player.player_word_array[random_word.index(guess)] = guess
            p player.player_word_array
        else
            incorrect_guesses_array.push(guess)
            p "Wrong! #{player.turns_left - 1} turns left! 
            Incorrect guesses: #{incorrect_guesses_array}
            #{player.player_word_array}"
        end
    end

    # def game_over?
    #     if random_word === player_word_array
    #         true
    #     elsif player.turns_left == 0
    #         true
    #     else
    #         false
    #     end
    # end

    def save_the_game
        #code
    end

    def load_a_saved_game
        #code
    end

    def run_game
        puts "The secret word has #{random_word.length} letters in it."
        p player.player_word_array
        puts "What is your first guess?"
        guess = gets.chomp
        is_letter_in_random_word?(guess)
    end
end
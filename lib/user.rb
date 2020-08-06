class User
    attr_accessor :name, :player_word_array, :turns_left, :incorrect_guesses_array
    attr_reader :unique_id, :random_word
    def initialize(name, random_word)
        @name = name
        @player_word_array = Array.new(random_word.length) {'-'}
        @incorrect_guesses_array = []
        @turns_left = 8
        @unique_id = "#{name}#{rand(10000)}"
        @random_word = random_word
    end

    def decrease_turn_count
        @turns_left -= 1
    end
end
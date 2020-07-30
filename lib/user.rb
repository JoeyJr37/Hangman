class User
    attr_accessor :player_word_array, :turns_left
    def initialize(name, random_word)
        @name = name
        @turns_left = 8
        @player_word_array = Array.new(random_word.length) {'-'}
    end

    def decrease_turn_count
        @turns_left -= 1
    end
end
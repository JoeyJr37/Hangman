class Dictionary
        def initialize; end

    def load_file(file)
        all_words = File.read file
        all_words
    end

    def select_word(list_of_words)
        list_of_words_array = list_of_words.split(" ")
        random_word = list_of_words_array.sample
        confirm_word_is_correct_length(random_word, list_of_words)
    end

    def confirm_word_is_correct_length(random_word, list_of_words)
        if random_word.length < 5
            p "#{random_word} is shorter than 5 characters"
            select_word(list_of_words)
        elsif random_word.length > 12
            p "#{random_word} is longer than 12 characters"
            select_word(list_of_words)
        else
            p random_word
        end
    end

    def get_word
        all_words = load_file("dictionary.txt")
        select_word(all_words)
    end
end
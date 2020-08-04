module Functions
    def self.to_json(random_word, name, player_word_array, incorrect_guesses_array, unique_id, turns_left)
        JSON.dump ({
            :random_word => random_word,
            :name => name,
            :player_word_array => player_word_array,
            :incorrect_guesses_array => incorrect_guesses_array,
            :unique_id => unique_id,
            :turns_left => turns_left
        })
    end

    def self.from_json(string)
        data = JSON.load string
        Game.new(data['random_word'], data['name'],data['player_word_array'], data['incorrect_guesses_array'], data['unique_id'], data['turns_left'])
    end

    def self.load_a_saved_game(file)
        puts "Welcome back!"
        puts "Loading saved game..."
        gamelogs = File.read "./saved_games/#{file}"
        saved_game = from_json(gamelogs)
        #saved_game.obtain_new_guess
        p saved_game
    end

    def self.save_the_game(player, random_word)
        Dir.mkdir("saved_games") unless Dir.exists? "saved_games"
        filename = "saved_games/#{player.unique_id}"
        gamelogs = to_json(random_word, player.name, player.player_word_array, player.incorrect_guesses_array, player.unique_id, player.turns_left)
        File.open(filename, 'w') do |file|
            file.puts gamelogs
        end
        p "I saved the game! Your unique id is: #{player.unique_id}."
    end
end
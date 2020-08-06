module Functions
    def self.to_json(player, random_word)
        JSON.dump ({
            :player => player,
            :random_word => random_word,
        })
    end

    def self.from_json(string)
        saved_player = JSON.load string
        p saved_player
        #Game.new(saved_player)
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
        gamelogs = to_json(player, random_word)
        File.open(filename, 'w') do |file|
            file.puts gamelogs
        end
        p "I saved the game! Your unique id is: #{player.unique_id}."
    end
end
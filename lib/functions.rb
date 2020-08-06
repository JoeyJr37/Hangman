module Functions
    def self.to_Marshal(player)
        Marshal.dump(player)
    end

    def self.from_Marshal(player)
        Marshal.load player
    end

    def self.load_a_saved_game(file)
        puts "Welcome back!"
        puts "Loading saved game..."
        gamelogs = File.read "./saved_games/#{file}"
        from_Marshal(gamelogs)
    end

    def self.save_the_game(player)
        Dir.mkdir("saved_games") unless Dir.exists? "saved_games"
        filename = "saved_games/#{player.unique_id}"
        gamelogs = to_Marshal(player)
        File.open(filename, 'w') do |file|
            file.puts gamelogs
        end
        p "I saved the game! Your unique id is: #{player.unique_id}."
    end
end
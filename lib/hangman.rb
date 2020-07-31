require_relative './game'

puts "Welcome to Hangman! Here are the rules: "
# some rules here
puts "What should I call you?"
name = gets.chomp
puts "Welcome #{name.capitalize}!"
puts "Selecting the secret word..."
Game.new(name).run_game
require_relative './game'

puts "Welcome to Hangman!"
puts "Here are the rules: "
# some rules here
puts "What is your name?"
name = gets.chomp
puts "Welcome #{name.capitalize}!"
puts "Selecting the secret word..."
Game.new(name).run_game
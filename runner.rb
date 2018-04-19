require_relative 'game.rb'
require_relative 'hidden_word.rb'
require_relative 'player.rb'
require 'io/console'

puts "Welcome to Snowman Game"
puts "What is your name?"
name = gets.chomp
puts "Please enter a word to guess"
word = STDIN.noecho(&:gets).chomp

hidden_word = HiddenWord.new word
player = Player.new name, 3
game = Game.new player, hidden_word
until game.won? || game.lost?
  puts "\n"
  puts "Hidden word: #{game.display_word}"
  puts "Enter your guess: "
  guess = gets.chomp
  game.make_guess guess
end
game.won? ? puts("Well done #{player.name}! You win!") : puts("Unlucky #{player.name}! You lose!")
puts "The word was #{hidden_word.word}"

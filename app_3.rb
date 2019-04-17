require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " -------------------------- "
puts "|        POO LANTA         |"
puts "|  il n'en restera qu'un   |"
puts " -------------------------- "

puts "Please enter your name to begin"
puts name_player = gets.chomp
my_game = Game.new(name_player)

#beginning of the game
puts

puts "==========> LET'S GO <============"
puts


while my_game.is_still_ongoing? == true do

    my_game.show_players
    my_game.new_players_in_sight
    my_game.menu
    puts "select your action choice"
    action = gets.chomp.to_s
    puts
    my_game.menu_choice(action)
    my_game.enemies_attack
end

my_game.end

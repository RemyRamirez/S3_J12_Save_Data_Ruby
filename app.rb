require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player_1 = Player.new("Josiane", 10)
player_2 = Player.new("Jose", 10)

puts
puts "Oh mon dieu un Josiane sauvage apparaît"
puts

puts "Le combat oppose #{player_1.name} à #{player_2.name}"
puts "Voici l'état de nos joueurs :"
player_2.show_state
player_1.show_state
puts

puts "==========> LET'S GO <============"
puts
#Round 1 : Josiane attack first
player_1.attack(player_2)
#Round 2 : Jose attack back
player_2.attack(player_1)
puts
puts "Voici l'état de nos joueurs :"
player_2.show_state
player_1.show_state
puts 

#From Round 3 : random attack either Josiane or Jose
round = 3
while player_1.life_points > 0 && player_2.life_points > 0 do

    i = rand(1..2)
    if i == 1
        player_1.attack(player_2)
        player_2.show_state
    else 
        player_2.attack(player_1)
        player_1.show_state
    end
    round += 1
    puts
    puts "Voici l'état de nos joueurs :"
    player_2.show_state
    player_1.show_state
    puts 

end

puts "========> END OF THE GAME <=========="

#binding.pry
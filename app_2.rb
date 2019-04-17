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

humanplayer = HumanPlayer.new("#{name_player}",100,1) #Human player initialization

#Bot players initialization
ennemies = []
player_1 = Player.new("Josiane", 10)  
player_2 = Player.new("Jose", 10)
ennemies << player_1
ennemies << player_2
puts
puts "Oh my gad two wild fellons appear"
puts

puts "It's a fight #{humanplayer.name} VS #{player_1.name} & #{player_2.name}"
puts "Here is the status of our players :"
humanplayer.show_state
player_2.show_state
player_1.show_state
puts

puts "==========> LET'S GO <============"
puts

#From Round 1 : random attack between Human player and the 2 wild cats Josiane or Jose
round = 1
while humanplayer.life_points > 0 && (player_1.life_points > 0 || player_2.life_points > 0) do

    puts "Here is your life points : #{humanplayer.show_state}"
    puts

    puts "what do you want to do ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts
    puts "attaquer un joueur en vue :"
    puts "1 - #{player_1.name} a #{player_1.show_state} points de vie"
    puts "2 - #{player_2.name} a #{player_2.show_state} points de vie"    
    
    action = gets.chomp
    
    if action == "a"
        humanplayer.search_weapon
    elsif action == "s"
        humanplayer.search_health_pack
    elsif action == "1"
        humanplayer.attack(player_1)
    elsif action == "2"
        humanplayer.attack(player_2)
    else puts "Please select option a, s, 1 or 2"
    end

    puts
    puts "Wild cat empire attack !"
    ennemies.each { |player| 
        if player.life_points >= 0
            player.attack(humanplayer)
        end
    }

    round += 1
    puts
    puts "Here is the status of our players :"
    humanplayer.show_state
    player_2.show_state
    player_1.show_state
    puts 
end

puts "========> END OF THE GAME <=========="
puts

if humanplayer.life_points > 0
    puts "Congrats you won !"
elsif humanplayer.life_points < 0
    puts "wild cats won bitch"
end

#binding.pry


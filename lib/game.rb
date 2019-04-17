require "pry"

class Game
    attr_accessor :humanplayer, :players_left, :enemies_in_sight 

    def initialize (humanplayer)
        @humanplayer = HumanPlayer.new("#{humanplayer}",100,1)
        @players_left = 10
        @player_1 = Player.new("Kevin", 10)  #Ici j'aurais voulu optimiser avec un upto ou while pour mettre les players dans les arrays
        @player_2 = Player.new("Kilian", 10)
        @player_3 = Player.new("Kimberley", 10)  
        @player_4 = Player.new("Kelly", 10)
        @enemies_in_sight = [@player_1, @player_2, @player_3, @player_4]
    end

    def kill_player
        @ennemies.each {
            |player| 
            if (player.life_points <= 0)
                @ennemies.delete(player)
            puts "#{player.name} is dead"
            end
        } 
    end

    def is_still_ongoing?
        if @humanplayer.life_points > 0 && (@enemies_in_sight.each { |player| player.life_points > 0}) && (players_left > -1)
            return true
        else
            return false
        end
    end

    def show_players #afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
        puts
        @humanplayer.show_state
        puts "2) #{@ennemies.size} ennemies are still fighting"
        puts
    end

    def menu #afficher le menu de choix
        command = 1
        puts "what do you want to do ?"
            puts "a - chercher une meilleure arme"
            puts "s - chercher à se soigner"
            puts
            puts "attaquer un joueur en vue :"
            @ennemies.each {
                |player| puts "#{command} - #{player.name} has #{player.life_points} points de vie"
                command += 1
            }
        
    end

    def menu_choice(action) #Cette méthode permet de faire réagir le jeu en fonction du choix, dans le menu, de l'utilisateur
        if action == "a"
            @humanplayer.search_weapon
        elsif action == "s"
            @humanplayer.search_health_pack
        elsif action == "1"
            @humanplayer.attack(@player_1)
        elsif action == "2"
            @humanplayer.attack(@player_2)
        elsif action == "3"
            @humanplayer.attack(@player_3)
        elsif action == "4"
            @humanplayer.attack(@player_4)
        else puts "Please select option a, s, 1, 2, 3 or 4"
        end
    
        kill_player
    end

    def enemies_attack #tous les ennemis vivants. Ils vont attaquer à tour de rôle le joueur humain.
        puts
        puts "Wild cat empire attack !"
        @ennemies.each { 
            |player| player.attack(@humanplayer)
        }
    end

    def new_players_in_sight
        i=5
        dice = rand(1..6)
        if @enemies_in_sight.size == players_left
            puts "all players are in sight"

        else
            if dice == 1
            puts "No player more"

            elsif dice == 2 || dice == 3 || dice == 4
                number_of_player = "player_#{rand(1..10000)}"
                @player_"#{i}" = Player.new("#{number_of_player}", 10)
                @enemies_in_sight << @player_"#{i}"
                i += 1
                puts " 1 player more"
                @players_left -= 1
            elsif dice == 5 || dice == 6
                number_of_player = "player_#{rand(1..10000)}"
                @player_"#{i}" = Player.new("#{number_of_player}", 10)
                @enemies_in_sight << @player_"#{i}"
                i += 1
                number_of_player = "player_#{rand(1..10000)}"
                @player_"#{i}" = Player.new("#{number_of_player}", 10)
                @enemies_in_sight << @player_"#{i}"
                i += 1
                puts " 2 players more"
                @players_left -= 2
            end

        end
    end

    def end #'affichage de fin de jeu. si humain gagne congrat sinon wild cats
        if humanplayer.life_points > 0
            puts "Congrats you won !"
        elsif humanplayer.life_points < 0
            puts "wild cats won bitch"
        end
        puts
        puts "========> END OF THE GAME <=========="
        puts
    end

#binding.pry

end
require "pry"

class Player
    attr_accessor :name, :life_points
    @@players = []


    def initialize (name,life_points)
        @name = name.to_s
        @life_points = life_points.to_i
        @@players << self
    end

    def self.players
        @@players
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_received)
        if damage_received.class != Integer
            puts "veuillez entrer un entier"
        else
            damage_received = damage_received.to_i
            @life_points = @life_points - damage_received
        end
        if @life_points <= 0 
            puts "T'es mauvais #{@name}, t'es mauvaiiiis ! Try again buddy"
        end
    end

    def attack (player_to_attack)
        puts "le joueur #{self.name} attaque le joueur #{player_to_attack.name}"
        
        @damage_given = compute_damage
        puts "il lui inflige #{@damage_given} points de dommages"
        player_to_attack.gets_damage(@damage_given)
    end

    def compute_damage
        return rand(1..6)
    end
    #binding.pry
end

class HumanPlayer < Player
    attr_accessor :weapon_level #on ajoute l'attribut pour le niveau de l'arme

    def initialize (name, life_points, weapon_level)
        @life_points = 100
        @weapon_level = weapon_level = 1
        super(name,life_points) #on récupère les attributs de la classe Player
    end

    def show_state
        puts "1) #{@name} has #{@life_points} life points and a weapon level at : #{@weapon_level}"
    end
    
    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        @new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{@new_weapon_level}"

        if @new_weapon_level > @weapon_level
            @weapon_level = @new_weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        elsif @new_weapon_level <= @weapon_level
            puts "Ah nan jme suis fait avoir Morray cette nouvelle arme n'est pas mieux. Je garde l'ancienne !"
        end
    end

    def search_health_pack
        i = rand(1..6)

        if i == 1 
            puts "Rien trouvé sois pas deg"
        elsif i == 5 || i == 4 || i == 3 || i == 2
            @life_points += 50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else i == 6
            @life_points += 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
                
        end
        if @life_points > 100 #if pour ne pas dépasser les 100 points de vie
            @life_points = 100
        end
    end


end

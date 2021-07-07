class Pemain
    attr_accessor :name
    def initialize(param_name, param_hitpoint, param_damage)
        @name = param_name
        @hitpoint = param_hitpoint
        @attack_damage = param_damage
    end
    def kurangi_hitpoint(damage)
        @hitpoint -= damage
    end
    def status
        puts "#{@name} has #{@hitpoint} hitpoints and #{@attack_damage} attack"
    end
    def meninggal?
        return @hitpoint <= 0
    end
end
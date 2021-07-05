class Pemain
    attr_accessor :name
    attr_writer :hitpoint, :attack_damage

    def set_hitpoint(param_hitpoint)
        self.hitpoint = param_hitpoint
    end
    def set_damage(param_damage)
        self.attack_damage = param_damage
    end
    def mungkin_80_persen_bisa_nangkis?
        probabilitas = rand()
        return probabilitas < 0.8
    end
    def serang(pemain_lain)
        puts "#{@name} attack #{pemain_lain.name} with #{@attack_damage} points"
        if pemain_lain.name == "Jin Sakai" && pemain_lain.mungkin_80_persen_bisa_nangkis?
            puts "#{pemain_lain.name} managed to fend off the attack"
        else
            pemain_lain.kurangi_hitpoint(@attack_damage)
        end
        pemain_lain.cetak
    end
    def kurangi_hitpoint(damage)
        @hitpoint -= damage
    end
    def cetak
        puts "#{@name} has #{@hitpoint} hitpoints and #{@attack_damage} attack"
    end
    def masih_hidup?
        return @hitpoint > 0
    end
end
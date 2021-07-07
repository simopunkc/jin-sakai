class Sekutu < Pemain
    def serang(pemain_lain)
        puts "#{@name} attack #{pemain_lain.name} with #{@attack_damage} points"
        pemain_lain.menerima_serangan(@attack_damage)
    end
    def menerima_serangan(damage)
        self.kurangi_hitpoint(damage)
        if self.meninggal?
            puts "#{@name} dies"
        else
            self.status
        end
    end
    def tambah_hitpoint(health)
        @hitpoint += health
    end
end
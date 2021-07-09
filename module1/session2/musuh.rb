class Musuh
    include Pemain
    kabur = false
    def mungkin_50_persen_kabur?
        probabilitas = rand()
        if probabilitas <= 0.5
            @kabur = true
            puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
        end
    end
    def get_kabur?
        return @kabur
    end
    def set_teknik(obj)
        @teknik = obj.teknik
    end
    def serang(pemain_lain)
        puts "#{@name} #{@teknik} #{pemain_lain.get_name} with #{@attack_damage} points"
        pemain_lain.menerima_serangan(@attack_damage)
    end
    def menerima_serangan(damage)
        self.kurangi_hitpoint(damage)
        if self.meninggal?
            puts "#{@name} dies"
        else
            self.status
            if @hitpoint <= 50
                self.mungkin_50_persen_kabur?
            end
        end
    end
end
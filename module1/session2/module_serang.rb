module PahlawanMenyerang
    def serang(pemain_lain)
        puts "#{@name} attack #{pemain_lain.get_name} with #{@attack_damage} points"
        pemain_lain.menerima_serangan(@attack_damage)
    end
end
class Pahlawan
    include Pemain
    include PahlawanMenyerang
    def mungkin_80_persen_bisa_nangkis?
        probabilitas = rand()
        return probabilitas < 0.8
    end
    def menerima_serangan(damage)
        if self.mungkin_80_persen_bisa_nangkis?
            puts "#{@name} deflects the attack"
        else
            self.kurangi_hitpoint(damage)            
        end
        if self.meninggal?
            puts "#{@name} dies"
            return
        end
        self.status
    end
    def sembuhkan(pemain_lain)
        puts "#{@name} heals #{pemain_lain.get_name}, restoring 20 hitpoints"
        pemain_lain.tambah_hitpoint(20)
    end
end
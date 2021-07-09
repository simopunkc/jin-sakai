class Sekutu
    include Pemain
    include PahlawanMenyerang
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
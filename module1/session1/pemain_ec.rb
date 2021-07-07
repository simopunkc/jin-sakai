require "./pemain"

class Pemain_EpicComeback < Pemain
    def mungkin_80_persen_bisa_nangkis?
        probabilitas = rand()
        return probabilitas < 0.8
    end
end
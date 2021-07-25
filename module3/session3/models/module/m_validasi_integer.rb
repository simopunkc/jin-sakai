module M_validasi_integer
    def cek_integer?(angka)
        if !/\A\d+\z/.match(angka)
            return false
        else
            return true
        end
    end
end
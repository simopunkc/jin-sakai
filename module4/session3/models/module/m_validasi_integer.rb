module M_validasi_integer
    def cek_integer?(angka)
        if !/[0-9]+/.match(angka.to_s)
            return false
        else
            return true
        end
    end
end
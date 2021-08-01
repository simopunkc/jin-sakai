module M_validasi_string
    def cek_string?(kata)
        if !/[A-Za-z\ ]+/.match(kata.to_s)
            return false
        else
            return true
        end
    end
end
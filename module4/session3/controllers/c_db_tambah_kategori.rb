require "./models/m_koneksi_db"
require "./models/module/m_validasi_string"
require "./models/m_db_tambah_kategori"

class C_db_tambah_kategori
    def self.simpan_kategori(params)
        name = params['name']
        model = M_db_tambah_kategori.new
        error = model.cek_valid(name)
        if error[:hasil] == false
            model.tambah_kategori(name)
            error = "none"
        end
        return error
    end
end
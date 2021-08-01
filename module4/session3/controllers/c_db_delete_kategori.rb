require "./models/m_koneksi_db"
require "./models/module/m_validasi_integer"
require "./models/module/m_validasi_kategori"
require "./models/m_db_delete_kategori"

class C_db_delete_kategori
    def self.delete_kategori(params)
        model = M_db_delete_kategori.new
        id = params[:id]
        error = model.cek_valid(id)
        if error[:hasil] == false
            model.delete_kategori(id)
            error = "none"
        end
        return error
    end
end
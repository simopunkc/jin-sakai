require "./models/m_koneksi_db"
require "./models/module/m_validasi_kategori"
require "./models/m_db_delete_kategori"

class C_db_delete_kategori
    def self.delete_kategori(params)
        model = M_db_delete_kategori.new
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        if !model.cek_kategori(id)
            error = {:hasil => true, :pesan => "id kategori tidak valid"}
        end
        if error[:hasil] == false
            model.delete_kategori(id)
            error = "none"
        end
        return error
    end
end
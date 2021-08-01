require "./models/m_koneksi_db"
require "./models/module/m_validasi_integer"
require "./models/module/m_validasi_item"
require "./models/module/m_validasi_kategori"
require "./models/m_db_delete_kategori_pada_item"

class C_db_delete_kategori_pada_item
    def self.delete_kategori(params)
        id = params[:id]
        id_kategori = params[:kate_id]
        model = M_db_delete_kategori_pada_item.new
        error = model.cek_valid(id,id_kategori)
        if error[:hasil] == false
            model.delete_kategori_pada_item(id,id_kategori)
            error = "none"
        end
        return error
    end
end
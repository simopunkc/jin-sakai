require_relative "../models/m_koneksi_db"
require_relative "../models/module/m_validasi_item"
require_relative "../models/module/m_validasi_kategori"
require_relative "../models/m_db_delete_kategori_pada_item"

class C_db_delete_kategori_pada_item
    def self.delete_kategori(params)
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        id_kategori = params[:kate_id]
        model = M_db_delete_kategori_pada_item.new
        if !model.cek_item(id)
            error = {:hasil => true, :pesan => "id items tidak valid"}
        elsif !model.cek_kategori(id_kategori)
            error = {:hasil => true, :pesan => "id kategori tidak valid"}
        end
        if error[:hasil] == false
            model.delete_kategori_pada_item(id,id_kategori)
            error = "none"
        end
        return error
    end
end
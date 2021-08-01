require "./models/m_koneksi_db"
require "./models/m_raw_category"
require "./models/module/m_validasi_string"
require "./models/module/m_validasi_integer"
require "./models/module/m_validasi_item"
require "./models/module/m_detail_item"
require "./models/module/m_db_item"
require "./models/module/m_get_semua_kategori"
require "./models/m_db_edit_item"

class C_db_edit_item
    def self.simpan_item(params)
        id = params[:id]
        name = params['name']
        price = params['price']
        model = M_db_edit_item.new
        kategori = model.get_semua_kategori()
        daftar_kategori = Array.new
        kategori.each do |kate|
            name_param = params["kategori#{kate.id}"]
            if name_param != nil
                daftar_kategori << kate.id.to_s
            end
        end
        error = model.cek_valid(name,price,id)
        if error[:hasil] == false
            model.edit_item(id,name,price,daftar_kategori)
            error = "none"
        end
        return error
    end
end
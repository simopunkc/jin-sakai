require "./models/m_koneksi_db"
require "./models/m_raw_category"
require "./models/module/m_validasi_integer"
require "./models/module/m_validasi_string"
require "./models/module/m_validasi_kategori"
require "./models/m_db_edit_kategori"

class C_db_edit_kategori
    def self.simpan_kategori(params)
        id = params[:id]
        name = params['name']
        model = M_db_edit_kategori.new
        error = model.cek_valid(name,id)
        if error[:hasil] == false
            model.edit_kategori(id,name)
            error = "none"
        end
        return error
    end
end
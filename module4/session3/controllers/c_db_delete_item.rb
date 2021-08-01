require "./models/m_koneksi_db"
require "./models/module/m_validasi_integer"
require "./models/module/m_validasi_item"
require "./models/m_db_delete_item"

class C_db_delete_item
    def self.delete_item(params)
        model = M_db_delete_item.new
        id = params[:id]
        error = model.cek_valid(id)
        if error[:hasil] == false
            model.delete_item(id)
            error = "none"
        end
        return error
    end
end
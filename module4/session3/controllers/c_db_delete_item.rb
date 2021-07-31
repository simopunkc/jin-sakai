require "./models/m_koneksi_db"
require "./models/module/m_validasi_item"
require "./models/m_db_delete_item"

class C_db_delete_item
    def self.delete_item(params)
        model = M_db_delete_item.new
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        if !model.cek_item(id)
            error = {:hasil => true, :pesan => "id items tidak valid"}
        end
        if error[:hasil] == false
            model.delete_item(id)
            error = "none"
        end
        return error
    end
end
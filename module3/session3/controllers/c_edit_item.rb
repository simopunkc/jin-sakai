require_relative "../models/m_koneksi_db"
require_relative "../models/m_raw_item"
require_relative "../models/m_raw_category"
require_relative "../models/module/m_validasi_item"
require_relative "../models/module/m_detail_item"
require_relative "../models/module/m_get_semua_kategori"
require_relative "../models/m_edit_item"

class C_edit_item
    def self.cetak_edit_item(params)
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        model = M_edit_item.new
        if !model.cek_item(id)
            error = {:hasil => true, :pesan => "id items tidak valid"}
        end
        if error[:hasil] == false
            items = model.get_detail_item(id)
            kategori = model.get_semua_kategori
            daftar_kategori = model.get_semua_kategori_pada_item(id)
            view = ERB.new(File.read(FOLDER_TEMPLATE + "/v_edit_item.erb"))
            view.result(binding)
        else
            return error
        end
    end
end
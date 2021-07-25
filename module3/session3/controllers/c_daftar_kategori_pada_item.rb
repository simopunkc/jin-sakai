require_relative "../models/m_koneksi_db"
require_relative "../models/m_raw_item"
require_relative "../models/m_raw_category"
require_relative "../models/module/m_detail_item"
require_relative "../models/m_daftar_kategori_pada_item"

class C_daftar_kategori_pada_item
    def self.cetak_daftar_kategori_pada_item(params)
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        model = M_daftar_kategori_pada_item.new
        single_item = model.get_detail_item(id)
        if single_item.size < 1
            error = {:hasil => true, :pesan => "id items tidak valid"}
        end
        if error[:hasil] == false
            items = model.get_semua_kategori_pada_item(id)
            view = ERB.new(File.read(FOLDER_TEMPLATE + "/v_daftar_kategori_pada_item.erb"))
            view.result(binding)
        else
            return error
        end
    end
end
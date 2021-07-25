require_relative "../models/m_koneksi_db"
require_relative "../models/m_raw_item"
require_relative "../models/module/m_validasi_item"
require_relative "../models/module/m_detail_item"
require_relative "../models/m_single_item"

class C_single_item
    def self.cetak_single_item(params)
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        model = M_single_item.new
        if !model.cek_item(id)
            error = {:hasil => true, :pesan => "id items tidak valid"}
        end
        if error[:hasil] == false
            items = model.get_detail_item(id)
            view = ERB.new(File.read(FOLDER_TEMPLATE + "/v_single_item.erb"))
            view.result(binding)
        else
            return error
        end
    end
end
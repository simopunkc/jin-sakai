require "./models/m_koneksi_db"
require "./models/m_raw_category"
require "./models/module/m_detail_kategori"
require "./models/m_single_kategori"

class C_single_kategori
    def self.cetak_single_kategori(params)
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        model = M_single_kategori.new
        kategori = model.get_detail_kategori(id)
        if kategori.size < 1
            error = {:hasil => true, :pesan => "id kategori tidak valid"}
        end
        if error[:hasil] == false
            items = model.get_semua_item_pada_kategori(id)
            view = ERB.new(File.read("./views/v_single_kategori.erb"))
            view.result(binding)
        else
            return error
        end
    end
end
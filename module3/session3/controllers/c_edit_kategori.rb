require "./models/m_koneksi_db"
require "./models/m_raw_category"
require "./models/module/m_validasi_kategori"
require "./models/module/m_detail_kategori"
require "./models/m_edit_kategori"

class C_edit_kategori
    def self.cetak_edit_kategori(params)
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        model = M_edit_kategori.new
        if !model.cek_kategori(id)
            error = {:hasil => true, :pesan => "id kategori tidak valid"}
        end
        if error[:hasil] == false
            items = model.get_detail_kategori(id)
            view = ERB.new(File.read("./views/v_edit_kategori.erb"))
            view.result(binding)
        else
            return error
        end
    end
end
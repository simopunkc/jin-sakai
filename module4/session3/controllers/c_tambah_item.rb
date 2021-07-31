require "./models/m_koneksi_db"
require "./models/m_raw_category"
require "./models/module/m_get_semua_kategori"
require "./models/m_tambah_item"

class C_tambah_item
    def self.cetak_tambah_item
        model = M_tambah_item.new
        kategori = model.get_semua_kategori
        view = ERB.new(File.read("./views/v_tambah_item.erb"))
        view.result(binding)
    end
end
require_relative "../models/m_koneksi_db"
require_relative "../models/m_raw_category"
require_relative "../models/module/m_get_semua_kategori"
require_relative "../models/m_tambah_item"

class C_tambah_item
    def self.cetak_tambah_item
        model = M_tambah_item.new
        kategori = model.get_semua_kategori
        view = ERB.new(File.read(FOLDER_TEMPLATE + "/v_tambah_item.erb"))
        view.result(binding)
    end
end
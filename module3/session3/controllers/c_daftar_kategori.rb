require_relative "../models/m_koneksi_db"
require_relative "../models/m_raw_category"
require_relative "../models/module/m_get_semua_kategori"
require_relative "../models/m_daftar_kategori"

class C_daftar_kategori
    def self.cetak_daftar_kategori
        model = M_daftar_kategori.new
        items = model.get_semua_kategori
        view = ERB.new(File.read(FOLDER_TEMPLATE + "/v_daftar_kategori.erb"))
        view.result(binding)
    end
end
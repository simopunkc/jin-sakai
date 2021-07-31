require "./models/m_koneksi_db"
require "./models/m_raw_item"
require "./models/m_home"

class C_home
    def self.cetak_homepage
        model = M_home.new
        items = model.get_semua_item
        view = ERB.new(File.read("./views/v_home.erb"))
        view.result(binding)
    end
end
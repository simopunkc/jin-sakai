require "./models/m_koneksi_db"
require "./models/m_raw_category"
require "./models/module/m_validasi_string"
require "./models/module/m_validasi_kategori"
require "./models/m_db_edit_kategori"

class C_db_edit_kategori
    def self.simpan_kategori(params)
        error = {:hasil => false, :pesan => ""}
        id = params[:id]
        name = params['name']
        model = M_db_edit_kategori.new
        if !model.cek_kategori(id)
            error = {:hasil => true, :pesan => "id tidak valid"}
        elsif name.empty?
            error = {:hasil => true, :pesan => "Nama wajib diisi"}
        elsif !model.cek_string?(name)
            error = {:hasil => true, :pesan => "Nama harus dalam bentuk string"}
        end
        if error[:hasil] == false
            model.edit_kategori(id,name)
            error = "none"
        end
        return error
    end
end
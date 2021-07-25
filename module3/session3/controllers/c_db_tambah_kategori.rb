require "./models/m_koneksi_db"
require "./models/module/m_validasi_string"
require "./models/m_db_tambah_kategori"

class C_db_tambah_kategori
    def self.simpan_kategori(params)
        error = {:hasil => false, :pesan => ""}
        name = params['name']
        model = M_db_tambah_kategori.new
        if name.empty?
            error = {:hasil => true, :pesan => "Nama kategori wajib diisi"}
        elsif !model.cek_string?(name)
            error = {:hasil => true, :pesan => "Nama harus dalam bentuk string"}
        end
        if error[:hasil] == false
            model.tambah_kategori(name)
            error = "none"
        end
        return error
    end
end
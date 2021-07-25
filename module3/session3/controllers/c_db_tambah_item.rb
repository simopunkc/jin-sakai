require "./models/m_koneksi_db"
require "./models/m_raw_category"
require "./models/module/m_validasi_string"
require "./models/module/m_validasi_integer"
require "./models/module/m_db_item"
require "./models/module/m_get_semua_kategori"
require "./models/m_db_tambah_item"

class C_db_tambah_item
    def self.simpan_item(params)
        error = {:hasil => false, :pesan => ""}
        name = params['name']
        price = params['price']
        model = M_db_tambah_item.new
        kategori = model.get_semua_kategori
        daftar_kategori = Array.new
        kategori.each do |kate|
            name_param = params["kategori#{kate.id}"]
            if name_param != nil
                daftar_kategori << kate.id.to_s
            end
        end
        if name.empty?
            error = {:hasil => true, :pesan => "Nama wajib diisi"}
        elsif !model.cek_string?(name)
            error = {:hasil => true, :pesan => "Nama harus dalam bentuk string"}
        end
        if !price.empty?
            if !model.cek_integer?(price)
                error = {:hasil => true, :pesan => "Price harus dalam bentuk angka"}
            end
        end
        if error[:hasil] == false
            model.simpan_item(name,price,daftar_kategori)
            error = "none"
        end
        return error
    end
end
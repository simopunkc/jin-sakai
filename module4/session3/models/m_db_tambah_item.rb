class M_db_tambah_item
    include M_koneksi_db
    include M_validasi_string
    include M_validasi_integer
    include M_get_semua_kategori
    include M_db_item
    def cek_valid(name,price)
        error = {:hasil => false, :pesan => ""}
        if name == nil or name == ""
            error = {:hasil => true, :pesan => "Nama wajib diisi"}
        elsif !cek_string?(name)
            error = {:hasil => true, :pesan => "Nama harus dalam bentuk string"}
        elsif price == nil or price == ""
            error = {:hasil => true, :pesan => "Price wajib diisi"}
        elsif !cek_integer?(price)
            error = {:hasil => true, :pesan => "Price harus dalam bentuk angka"}
        end
        return error
    end

    def insert_item(name,price)
        client=buat_koneksi_db
        client.query("insert into items (name,price) values ('#{name}',#{price})")
        client.last_id
    end

    def simpan_item(name,price,kategori=nil)
        id = insert_item(name,price)
        if kategori.size > 0
            kategori.each do | data |
                tambah_item_ke_kategori(id,data)
            end
        end
    end
end
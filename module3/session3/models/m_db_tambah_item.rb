class M_db_tambah_item
    include M_koneksi_db
    include M_validasi_string
    include M_validasi_integer
    include M_get_semua_kategori
    include M_db_item
    def simpan_item(name,price,kategori)
        client=buat_koneksi_db
        client.query("insert into items (name,price) values ('#{name}',#{price})")
        id = client.last_id
        if kategori.size > 0
            kategori.each do | data |
                tambah_item_ke_kategori(id,data)
            end
        end
    end
end
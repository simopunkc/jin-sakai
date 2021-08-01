class M_db_edit_item
    include M_koneksi_db
    include M_validasi_string
    include M_validasi_integer
    include M_validasi_item
    include M_get_semua_kategori
    include M_detail_item
    include M_db_item
    def update_item(name,price,id)
        client=buat_koneksi_db
        client.query("update items set name='#{name}', price=#{price} where id=#{id}")
    end

    def edit_item(id,name,price,kategori)
        update_item(name,price,id)
        if kategori.size > 0
            kategori.each do | data |
                tambah_item_ke_kategori(id,data)
            end
        end
        clean_item_dari_kategori(kategori,id)
    end
end
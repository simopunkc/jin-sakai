class M_db_delete_kategori
    include M_koneksi_db
    include M_validasi_kategori
    def del_kategori(id_kategori)
        client=buat_koneksi_db
        client.query("delete from categories where id=#{id_kategori}")
    end

    def del_item_kategori(id_kategori)
        client=buat_koneksi_db
        client.query("delete from item_categories where category_id=#{id_kategori}")
    end

    def delete_kategori(id_kategori)
        del_kategori(id_kategori)
        del_item_kategori(id_kategori)
    end
end
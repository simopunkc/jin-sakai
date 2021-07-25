class M_db_delete_kategori_pada_item
    include M_koneksi_db
    include M_validasi_item
    include M_validasi_kategori
    def delete_kategori_pada_item(id_item,id_kategori)
        client=buat_koneksi_db
        client.query("delete from item_categories where item_id=#{id_item} and category_id=#{id_kategori}")
    end
end
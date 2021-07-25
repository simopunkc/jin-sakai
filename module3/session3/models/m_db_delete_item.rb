class M_db_delete_item
    include M_koneksi_db
    include M_validasi_item
    def delete_item(id_item)
        client=buat_koneksi_db
        client.query("delete from items where id=#{id_item}")
        client.query("delete from item_categories where item_id=#{id_item}")
    end
end
class M_db_edit_kategori
    include M_koneksi_db
    include M_validasi_string
    include M_validasi_kategori
    def edit_kategori(id,name)
        client=buat_koneksi_db
        client.query("update categories set name='#{name}' where id=#{id} limit 1")
    end
end
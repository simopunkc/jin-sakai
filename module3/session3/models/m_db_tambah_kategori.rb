class M_db_tambah_kategori
    include M_koneksi_db
    include M_validasi_string
    def tambah_kategori(name)
        client=buat_koneksi_db
        client.query("insert into categories (name) values ('#{name}')")
    end
end
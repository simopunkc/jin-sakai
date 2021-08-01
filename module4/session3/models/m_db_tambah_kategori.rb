class M_db_tambah_kategori
    include M_koneksi_db
    include M_validasi_string
    def cek_valid(name)
        error = {:hasil => false, :pesan => ""}
        if name == nil or name == ""
            error = {:hasil => true, :pesan => "Nama wajib diisi"}
        elsif !cek_string?(name)
            error = {:hasil => true, :pesan => "Nama harus dalam bentuk string"}
        end
        return error
    end

    def tambah_kategori(name)
        client=buat_koneksi_db
        client.query("insert into categories (name) values ('#{name}')")
    end
end
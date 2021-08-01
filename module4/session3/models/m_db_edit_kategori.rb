class M_db_edit_kategori
    include M_koneksi_db
    include M_validasi_integer
    include M_validasi_string
    include M_validasi_kategori
    def cek_valid(name,id)
        error = {:hasil => false, :pesan => ""}
        if id == nil or id == ""
            error = {:hasil => true, :pesan => "ID wajib diisi"}
        elsif !cek_integer?(id)
            error = {:hasil => true, :pesan => "ID harus dalam bentuk angka"}
        elsif !cek_kategori(id)
            error = {:hasil => true, :pesan => "ID tidak valid"}
        elsif name == nil or name == ""
            error = {:hasil => true, :pesan => "Nama wajib diisi"}
        elsif !cek_string?(name)
            error = {:hasil => true, :pesan => "Nama harus dalam bentuk string"}
        end
        return error
    end

    def edit_kategori(id,name)
        client=buat_koneksi_db
        client.query("update categories set name='#{name}' where id=#{id} limit 1")
    end
end
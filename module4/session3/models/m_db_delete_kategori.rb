class M_db_delete_kategori
    include M_koneksi_db
    include M_validasi_integer
    include M_validasi_kategori
    def cek_valid(id)
        error = {:hasil => false, :pesan => ""}
        if id == nil or id == ""
            error = {:hasil => true, :pesan => "ID wajib diisi"}
        elsif !cek_integer?(id)
            error = {:hasil => true, :pesan => "ID harus dalam bentuk angka"}
        elsif !cek_kategori(id)
            error = {:hasil => true, :pesan => "ID tidak valid"}
        end
        return error
    end

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
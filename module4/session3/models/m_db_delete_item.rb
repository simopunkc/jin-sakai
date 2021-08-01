class M_db_delete_item
    include M_koneksi_db
    include M_validasi_integer
    include M_validasi_item
    def cek_valid(id)
        error = {:hasil => false, :pesan => ""}
        if id == nil or id == ""
            error = {:hasil => true, :pesan => "ID wajib diisi"}
        elsif !cek_integer?(id)
            error = {:hasil => true, :pesan => "ID harus dalam bentuk angka"}
        elsif !cek_item(id)
            error = {:hasil => true, :pesan => "ID tidak valid"}
        end
        return error
    end

    def del_item(id_item)
        client=buat_koneksi_db
        client.query("delete from items where id=#{id_item}")
    end

    def del_kategori(id_item)
        client=buat_koneksi_db
        client.query("delete from item_categories where item_id=#{id_item}")
    end

    def delete_item(id_item)
        del_item(id_item)
        del_kategori(id_item)
    end
end
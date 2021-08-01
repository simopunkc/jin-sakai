class M_db_delete_kategori_pada_item
    include M_koneksi_db
    include M_validasi_integer
    include M_validasi_item
    include M_validasi_kategori
    def cek_valid(id_item,id_kategori)
        error = {:hasil => false, :pesan => ""}
        if id_item == nil or id_item == ""
            error = {:hasil => true, :pesan => "ID item wajib diisi"}
        elsif !cek_integer?(id_item)
            error = {:hasil => true, :pesan => "ID item harus dalam bentuk angka"}
        elsif !cek_item(id_item)
            error = {:hasil => true, :pesan => "ID item tidak valid"}
        elsif id_kategori == nil or id_kategori == ""
            error = {:hasil => true, :pesan => "ID kategori wajib diisi"}
        elsif !cek_integer?(id_kategori)
            error = {:hasil => true, :pesan => "ID kategori harus dalam bentuk angka"}
        elsif !cek_kategori(id_kategori)
            error = {:hasil => true, :pesan => "ID kategori tidak valid"}
        end
        return error
    end

    def delete_kategori_pada_item(id_item,id_kategori)
        client=buat_koneksi_db
        client.query("delete from item_categories where item_id=#{id_item} and category_id=#{id_kategori}")
    end
end
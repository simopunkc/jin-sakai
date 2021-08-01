class M_db_edit_item
    include M_koneksi_db
    include M_validasi_string
    include M_validasi_integer
    include M_validasi_item
    include M_get_semua_kategori
    include M_detail_item
    include M_db_item
    def cek_valid(name,price,id)
        error = {:hasil => false, :pesan => ""}
        if id == nil or id == ""
            error = {:hasil => true, :pesan => "ID wajib diisi"}
        elsif !cek_integer?(id)
            error = {:hasil => true, :pesan => "ID harus dalam bentuk angka"}
        elsif !cek_item(id)
            error = {:hasil => true, :pesan => "ID tidak valid"}
        elsif name == nil or name == ""
            error = {:hasil => true, :pesan => "Nama wajib diisi"}
        elsif !cek_string?(name)
            error = {:hasil => true, :pesan => "Nama harus dalam bentuk string"}
        elsif price == nil or price == ""
            error = {:hasil => true, :pesan => "Price wajib diisi"}
        elsif !cek_integer?(price)
            error = {:hasil => true, :pesan => "Price harus dalam bentuk angka"}
        end
        return error
    end

    def update_item(name,price,id)
        client=buat_koneksi_db
        client.query("update items set name='#{name}', price=#{price} where id=#{id}")
    end

    def edit_item(id,name,price,kategori)
        update_item(name,price,id)
        if kategori.size > 0
            kategori.each do | data |
                tambah_item_ke_kategori(id,data)
            end
        end
        clean_item_dari_kategori(kategori,id)
    end
end
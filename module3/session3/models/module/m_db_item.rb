module M_db_item
    def cek_item_di_kategori(id_item,id_kategori)
        client=buat_koneksi_db
        tersedia = client.query("select count(item_id) as jumlah from item_categories where item_id=#{id_item} and category_id=#{id_kategori} limit 1")
        tampung = Array.new
        tersedia.each do | data |
            tampung.push(data["jumlah"])
        end
        return tampung[0]
    end
    def tambah_item_ke_kategori(id_item,id_kategori)
        client=buat_koneksi_db
        if cek_item_di_kategori(id_item,id_kategori) == 0
            client.query("insert into item_categories (item_id, category_id) values (#{id_item}, #{id_kategori})")
        end
    end
    def clean_item_dari_kategori(daftar_kategori,id_item)
        client=buat_koneksi_db
        if daftar_kategori.size > 0
            daftar_exclude=daftar_kategori.join(",")
            client.query("delete from item_categories where item_id=#{id_item} and category_id NOT IN (#{daftar_exclude})")
        else
            client.query("delete from item_categories where item_id=#{id_item}")
        end
    end
end
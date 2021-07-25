module M_validasi_item
    def cek_item(id)
        client=buat_koneksi_db
        tersedia = client.query("select count(id) from items where id=#{id} limit 1")
        tampung = Array.new
        tersedia.each do | data |
            tampung.push(data["count(id)"])
        end
        return tampung.size
    end
end
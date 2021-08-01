module M_validasi_kategori
    def cek_kategori(id)
        client=buat_koneksi_db
        tersedia = client.query("select count(id) from categories where id=#{id} limit 1")
        tampung = 0
        tersedia.each do | data |
            tampung = data["count(id)"]
        end
        return tampung
    end
end
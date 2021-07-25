module M_get_semua_kategori
    def get_semua_kategori
        client=buat_koneksi_db
        rawData = client.query("select * from categories")
        items = Array.new
        rawData.each do | data |
            category = M_category.new(data["name"], data["id"])
            items.push(category)
        end
        items
    end
end
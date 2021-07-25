module M_detail_kategori
    def get_detail_kategori(id)
        client=buat_koneksi_db
        rawData = client.query("select * from categories where id = #{id} limit 1")
        items = Array.new
        rawData.each do | data |
            category = M_category.new(data["name"], data["id"])
            items.push(category)
        end
        items
    end
end
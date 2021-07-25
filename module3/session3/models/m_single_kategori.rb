class M_single_kategori
    include M_koneksi_db
    include M_detail_kategori
    def get_semua_item_pada_kategori(id)
        client=buat_koneksi_db
        rawData = client.query("SELECT items.name, items.price, items.id FROM items LEFT JOIN item_categories ON items.id = item_categories.item_id LEFT JOIN categories ON categories.id = item_categories.category_id where categories.id = #{id}")
        items = Array.new
        rawData.each do | data |
            item = M_item.new(data["name"],data["price"],data["id"])
            items.push(item)
        end
        items
    end
end
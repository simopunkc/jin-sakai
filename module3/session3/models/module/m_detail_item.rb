module M_detail_item
    def get_detail_item(id)
        client=buat_koneksi_db
        rawData = client.query("SELECT items.name, items.price, items.id, GROUP_CONCAT(categories.name) as category_name FROM item_categories LEFT JOIN items ON items.id = item_categories.item_id LEFT JOIN categories ON categories.id = item_categories.category_id where items.id = #{id} limit 1")
        items = Array.new
        rawData.each do | data |
            item = M_item.new(data["name"],data["price"],data["id"],data["category_name"])
            items.push(item)
        end
        items
    end
end
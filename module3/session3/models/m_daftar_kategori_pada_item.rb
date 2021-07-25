class M_daftar_kategori_pada_item
    include M_koneksi_db
    include M_detail_item
    def get_semua_kategori_pada_item(id_item)
        client=buat_koneksi_db
        rawData = client.query("SELECT categories.id as category_id, categories.name as category_name FROM item_categories LEFT JOIN categories ON item_categories.category_id = categories.id  WHERE item_categories.item_id=#{id_item}")
        items = Array.new
        rawData.each do | data |
            category = M_category.new(data["category_name"], data["category_id"])
            items.push(category)
        end
        items
    end
end
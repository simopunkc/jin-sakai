class M_edit_kategori
    include M_koneksi_db
    include M_validasi_kategori
    include M_detail_kategori
    def get_semua_kategori_pada_item(id_item)
        client=buat_koneksi_db
        rawData = client.query("SELECT categories.id as category_id FROM item_categories LEFT JOIN categories ON item_categories.category_id = categories.id  WHERE item_categories.item_id=#{id_item}")
        items = Array.new
        rawData.each do | data |
            items.push(data["category_id"])
        end
        items
    end
end
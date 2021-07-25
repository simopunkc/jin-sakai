class M_home
    include M_koneksi_db
    def get_semua_item
        client=buat_koneksi_db
        rawData = client.query("select * from items")
        items = Array.new
        rawData.each do |data|
            item = M_item.new(data["name"],data["price"],data["id"])
            items.push(item)
        end
        items
    end
end
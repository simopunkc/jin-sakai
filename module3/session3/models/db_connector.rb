require 'mysql2'
require './m_item'
require './m_category'


def get_all_items_include_categories
    client=buat_koneksi_db
    rawData = client.query("SELECT items.name, items.price, items.id, GROUP_CONCAT(categories.name) as category_name FROM item_categories LEFT JOIN items ON items.id = item_categories.item_id LEFT JOIN categories ON categories.id = item_categories.category_id GROUP BY items.name")
    items = Array.new
    rawData.each do | data |
        item = M_item.new(data["name"],data["price"],data["id"],data["category_name"])
        items.push(item)
    end
    items
end

def create_new_item(name,price,id_kategori)
    client=buat_koneksi_db
    client.query("insert into items (name,price) values ('#{name}',#{price})")
    id = client.last_id
    client.query("insert into item_categories (item_id,category_id) values (#{id},#{id_kategori})")
end


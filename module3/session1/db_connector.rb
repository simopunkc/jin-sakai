require 'mysql2'
require './item'
require './category'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "",
        :database => "food_oms_db"
    )
    client
end

def get_all_items
    client=create_db_client
    rawData = client.query("select * from items")
    items = Array.new
    rawData.each do |data|
        item = Item.new(data["name"],data["price"],data["id"])
        items.push(item)
    end
    items
end

def cek_integer?(angka)
    if !/\A\d+\z/.match(angka)
        return false
    else
        return true
    end
end

def cek_string?(kata)
    if !/[A-Za-z\ ]+/.match(kata)
        return false
    else
        return true
    end
end

def get_all_categories
    client=create_db_client
    rawData = client.query("select * from categories")
    items = Array.new
    rawData.each do | data |
        category = Category.new(data["name"], data["id"])
        items.push(category)
    end
    items
end

def get_all_items_include_categories
    client=create_db_client
    rawData = client.query("SELECT items.name, items.price, items.id, categories.name as category_name, category.id as category_id FROM item_categories LEFT JOIN items ON items.id = item_categories.item_id LEFT JOIN categories ON categories.id = item_categories.category_id GROUP BY items.name")
    items = Array.new
    rawData.each do | data |
        category = Category.new(data["category_name"], data["category_id"])
        item = Item.new(data["name"],data["price"],data["id"],category)
        items.push(item)
    end
    items
end

def create_new_item(name,price,id_kategori)
    client=create_db_client
    client.query("insert into items (name,price) values ('#{name}',#{price})")
    id = client.last_id
    client.query("insert into item_categories (item_id,category_id) values (#{id},#{id_kategori})")
end

def cek_items(id)
    client=create_db_client
    tersedia = client.query("select count(id) from items where id=#{id} limit 1")
    tampung = Array.new
    tersedia.each do | data |
        tampung.push(data["count(id)"])
    end
    return tampung.size
end

def cek_kategori(id)
    client=create_db_client
    tersedia = client.query("select count(id) from categories where id=#{id} limit 1")
    tampung = Array.new
    tersedia.each do | data |
        tampung.push(data["count(id)"])
    end
    return tampung.size
end

def edit_items(id,name,price,kategori)
    client=create_db_client
    client.query("update item_categories set category_id=#{kategori} where item_id=#{id}")
    client.query("update items set name='#{name}', price=#{price} where id=#{id}")
end

def delete_items(id)
    client=create_db_client
    client.query("delete from items where id=#{id}")
    client.query("delete from item_categories where item_id=#{id}")
end

def single_items(id)
    client=create_db_client
    rawData = client.query("SELECT items.name, items.price, items.id, categories.id as category_id, categories.name as category_name FROM item_categories LEFT JOIN items ON items.id = item_categories.item_id LEFT JOIN categories ON categories.id = item_categories.category_id where items.id = #{id} limit 1")
    items = Array.new
    rawData.each do | data |
        category = Category.new(data["category_name"], data["category_id"])
        item = Item.new(data["name"],data["price"],data["id"],category)
        items.push(item)
    end
    items
end
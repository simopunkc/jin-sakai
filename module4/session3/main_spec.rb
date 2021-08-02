require 'mysql2'
require 'spec_helper'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require "./controllers/c_home"
require "./controllers/c_tambah_item"
require "./controllers/c_db_tambah_item"
require "./controllers/c_edit_item"
require "./controllers/c_db_edit_item"
require "./controllers/c_single_item"
require "./controllers/c_db_delete_item"
require "./controllers/c_daftar_kategori"
require "./controllers/c_tambah_kategori"
require "./controllers/c_single_kategori"
require "./controllers/c_edit_kategori"
require "./controllers/c_db_delete_kategori"
require "./controllers/c_db_tambah_kategori"
require "./controllers/c_db_edit_kategori"
require "./controllers/c_daftar_kategori_pada_item"
require "./controllers/c_db_delete_kategori_pada_item"

describe C_home do
    it "render home" do
        items = []
        view = ERB.new(File.read("./views/v_home.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_tambah_item do
    it "render tambah_item" do
        kategori = []
        view = ERB.new(File.read("./views/v_tambah_item.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_db_tambah_item do
    it "should exist method simpan_item" do
        objek = class_double(C_db_tambah_item)
        param = { "name"=>'mie', "price"=>5000 }
        allow(objek).to receive(:simpan_item).with(param)
        objek.simpan_item(param)
        expect(objek).to have_received(:simpan_item).with(param)
    end
end

describe C_edit_item do
    it "render edit_item" do
        items = []
        kategori = []
        daftar_kategori = []
        view = ERB.new(File.read("./views/v_edit_item.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_db_edit_item do
    it "should exist method simpan_item" do
        objek = class_double(C_db_edit_item)
        param = { :id=>1, "name"=>'mie', "price"=>5000 }
        allow(objek).to receive(:simpan_item).with(param)
        objek.simpan_item(param)
        expect(objek).to have_received(:simpan_item).with(param)
    end
end

describe C_single_item do
    it "render single_item" do
        items = []
        view = ERB.new(File.read("./views/v_single_item.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_db_delete_item do
    it "should exist method delete_item" do
        objek = class_double(C_db_delete_item)
        param = { :id=>1 }
        allow(objek).to receive(:delete_item).with(param)
        objek.delete_item(param)
        expect(objek).to have_received(:delete_item).with(param)
    end
end

describe C_daftar_kategori do
    it "render daftar_kategori" do
        items = []
        view = ERB.new(File.read("./views/v_daftar_kategori.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_tambah_kategori do
    it "render tambah_kategori" do
        view = ERB.new(File.read("./views/v_tambah_kategori.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_single_kategori do
    it "render single_kategori" do
        kategori = []
        items = []
        view = ERB.new(File.read("./views/v_single_kategori.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_edit_kategori do
    it "render edit_kategori" do
        items = []
        view = ERB.new(File.read("./views/v_edit_kategori.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_db_delete_kategori do
    it "should exist method delete_kategori" do
        objek = class_double(C_db_delete_kategori)
        param = { :id=>1 }
        allow(objek).to receive(:delete_kategori).with(param)
        objek.delete_kategori(param)
        expect(objek).to have_received(:delete_kategori).with(param)
    end
end

describe C_db_tambah_kategori do
    it "should exist method simpan_kategori" do
        objek = class_double(C_db_tambah_kategori)
        param = { 'name'=>'main dish' }
        allow(objek).to receive(:simpan_kategori).with(param)
        objek.simpan_kategori(param)
        expect(objek).to have_received(:simpan_kategori).with(param)
    end
end

describe C_db_edit_kategori do
    it "should exist method simpan_kategori" do
        objek = class_double(C_db_edit_kategori)
        param = { :id=>1, 'name'=>'main dish' }
        allow(objek).to receive(:simpan_kategori).with(param)
        objek.simpan_kategori(param)
        expect(objek).to have_received(:simpan_kategori).with(param)
    end
end

describe C_daftar_kategori_pada_item do
    it "render daftar_kategori_pada_item" do
        single_item = []
        items = []
        view = ERB.new(File.read("./views/v_daftar_kategori_pada_item.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_db_delete_kategori_pada_item do
    it "should exist method delete_kategori" do
        objek = class_double(C_db_delete_kategori_pada_item)
        param = { :id=>1, 'name'=>'main dish' }
        allow(objek).to receive(:delete_kategori).with(param)
        objek.delete_kategori(param)
        expect(objek).to have_received(:delete_kategori).with(param)
    end
end

describe M_db_tambah_item do
    it "#insert_item" do
        item = M_item.new('mie',5000,1)
        query = "insert into items (name,price) values ('#{item.name}',#{item.price})"
        mock = double
        allow(Mysql2::Client).to receive(:new).and_return(mock)
        expect(mock).to receive(:query).with(query)
        expect(mock).to receive(:last_id)
        M_db_tambah_item.new.insert_item(item.name,item.price)
    end
    before(:each) do
        @hasil = instance_double(M_db_tambah_item)
    end
    it "should blank name" do
        item = M_item.new('',5000)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price).and_return({:hasil => true, :pesan => "Nama wajib diisi"})
        output = @hasil.cek_valid(item.name,item.price)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price)
        expect(output).to eq({:hasil => true, :pesan => "Nama wajib diisi"})
    end
    it "should name string" do
        item = M_item.new(1,5000)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price).and_return({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
        output = @hasil.cek_valid(item.name,item.price)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price)
        expect(output).to eq({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
    end
    it "should blank price" do
        item = M_item.new('mie',nil)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price).and_return({:hasil => true, :pesan => "Price wajib diisi"})
        output = @hasil.cek_valid(item.name,item.price)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price)
        expect(output).to eq({:hasil => true, :pesan => "Price wajib diisi"})
    end
    it "should price integer" do
        item = M_item.new('mie',"bawang")
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price).and_return({:hasil => true, :pesan => "Price harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.name,item.price)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price)
        expect(output).to eq({:hasil => true, :pesan => "Price harus dalam bentuk angka"})
    end
    it "should valid parameter" do
        item = M_item.new('mie',5000)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price).and_return({:hasil => false, :pesan => ""})
        output = @hasil.cek_valid(item.name,item.price)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price)
        expect(output).to eq({:hasil => false, :pesan => ""})
    end
    it "should exist method simpan_item" do
        item = M_item.new('mie',5000,nil,[])
        allow(@hasil).to receive(:simpan_item).with(item.name,item.price,item.category)
        @hasil.simpan_item(item.name,item.price,item.category)
        expect(@hasil).to have_received(:simpan_item).with(item.name,item.price,item.category)
    end
end

describe M_db_edit_item do
    it "#update_item" do
        item = M_item.new('Nasi Goreng',20000,1)
        query = "update items set name='#{item.name}', price=#{item.price} where id=#{item.id}"
        mock = double
        allow(Mysql2::Client).to receive(:new).and_return(mock)
        expect(mock).to receive(:query).with(query)
        expect(mock).not_to be_falsey
        M_db_edit_item.new.update_item(item.name,item.price,item.id)
    end
    before(:each) do
        @hasil = instance_double(M_db_edit_item)
    end
    it "should blank id" do
        item = M_item.new('mie',5000,'')
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price,item.id).and_return({:hasil => true, :pesan => "ID wajib diisi"})
        output = @hasil.cek_valid(item.name,item.price,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price,item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID wajib diisi"})
    end
    it "should id integer" do
        item = M_item.new('mie',5000,'aaa')
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price,item.id).and_return({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.name,item.price,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price,item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
    end
    it "should id invalid" do
        item = M_item.new('mie',5000,0)
        allow(@hasil).to receive(:cek_item).with(item.id).and_return(0)
        output = @hasil.cek_item(item.id)
        expect(@hasil).to have_received(:cek_item).with(item.id)
        expect(output).to eq(0)
    end
    it "should blank name" do
        item = M_item.new('',5000,1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price,item.id).and_return({:hasil => true, :pesan => "Nama wajib diisi"})
        output = @hasil.cek_valid(item.name,item.price,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price,item.id)
        expect(output).to eq({:hasil => true, :pesan => "Nama wajib diisi"})
    end
    it "should name string" do
        item = M_item.new(1,5000,1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price,item.id).and_return({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
        output = @hasil.cek_valid(item.name,item.price,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price,item.id)
        expect(output).to eq({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
    end
    it "should blank price" do
        item = M_item.new('mie',nil,1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price,item.id).and_return({:hasil => true, :pesan => "Price wajib diisi"})
        output = @hasil.cek_valid(item.name,item.price,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price,item.id)
        expect(output).to eq({:hasil => true, :pesan => "Price wajib diisi"})
    end
    it "should price integer" do
        item = M_item.new('mie',"bawang",1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price,item.id).and_return({:hasil => true, :pesan => "Price harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.name,item.price,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price,item.id)
        expect(output).to eq({:hasil => true, :pesan => "Price harus dalam bentuk angka"})
    end
    it "should valid parameter" do
        item = M_item.new('mie',5000,1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.price,item.id).and_return({:hasil => false, :pesan => ""})
        output = @hasil.cek_valid(item.name,item.price,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.price,item.id)
        expect(output).to eq({:hasil => false, :pesan => ""})
    end
    it "should exist method edit_item" do
        item = M_item.new('mie',5000,1,[])
        allow(@hasil).to receive(:edit_item).with(item.id,item.name,item.price,item.category)
        @hasil.edit_item(item.id,item.name,item.price,item.category)
        expect(@hasil).to have_received(:edit_item).with(item.id,item.name,item.price,item.category)
    end
end

describe M_db_delete_item do
    before(:each) do
        @id_item = 1
        @mock = double
        allow(Mysql2::Client).to receive(:new).and_return(@mock)
    end
    it "#del_item" do
        query = "delete from items where id=#{@id_item}"
        expect(@mock).to receive(:query).with(query)
        expect(@mock).not_to be_falsey
        M_db_delete_item.new.del_item(@id_item)
    end
    it "#del_kategori" do
        query = "delete from item_categories where item_id=#{@id_item}"
        expect(@mock).to receive(:query).with(query)
        expect(@mock).not_to be_falsey
        M_db_delete_item.new.del_kategori(@id_item)
    end
    before(:each) do
        @hasil = instance_double(M_db_delete_item)
    end
    it "should blank id" do
        item = M_item.new('mie',5000,'')
        allow(@hasil).to receive(:cek_valid).with(item.id).and_return({:hasil => true, :pesan => "ID wajib diisi"})
        output = @hasil.cek_valid(item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID wajib diisi"})
    end
    it "should id integer" do
        item = M_item.new('mie',5000,'aaa')
        allow(@hasil).to receive(:cek_valid).with(item.id).and_return({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
    end
    it "should id invalid" do
        item = M_item.new('mie',5000,0)
        allow(@hasil).to receive(:cek_item).with(item.id).and_return(0)
        output = @hasil.cek_item(item.id)
        expect(@hasil).to have_received(:cek_item).with(item.id)
        expect(output).to eq(0)
    end
    it "should valid parameter" do
        item = M_item.new('mie',5000,1)
        allow(@hasil).to receive(:cek_valid).with(item.id).and_return({:hasil => false, :pesan => ""})
        output = @hasil.cek_valid(item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id)
        expect(output).to eq({:hasil => false, :pesan => ""})
    end
    it "should exist method delete_item" do
        item = M_item.new('mie',5000,1)
        allow(@hasil).to receive(:delete_item).with(item.id)
        @hasil.delete_item(item.id)
        expect(@hasil).to have_received(:delete_item).with(item.id)
    end
end

describe M_db_delete_kategori do
    before(:each) do
        @id_kategori = 1
        @mock = double
        allow(Mysql2::Client).to receive(:new).and_return(@mock)
    end
    it "#del_kategori" do
        query = "delete from categories where id=#{@id_kategori}"
        expect(@mock).to receive(:query).with(query)
        expect(@mock).not_to be_falsey
        M_db_delete_kategori.new.del_kategori(@id_kategori)
    end
    it "#del_item_kategori" do
        query = "delete from item_categories where category_id=#{@id_kategori}"
        expect(@mock).to receive(:query).with(query)
        expect(@mock).not_to be_falsey
        M_db_delete_kategori.new.del_item_kategori(@id_kategori)
    end
    before(:each) do
        @hasil = instance_double(M_db_delete_kategori)
    end
    it "should blank id" do
        item = M_category.new('mie','')
        allow(@hasil).to receive(:cek_valid).with(item.id).and_return({:hasil => true, :pesan => "ID wajib diisi"})
        output = @hasil.cek_valid(item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID wajib diisi"})
    end
    it "should id integer" do
        item = M_category.new('mie','aaa')
        allow(@hasil).to receive(:cek_valid).with(item.id).and_return({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
    end
    it "should id invalid" do
        item = M_category.new('mie',0)
        allow(@hasil).to receive(:cek_kategori).with(item.id).and_return(0)
        output = @hasil.cek_kategori(item.id)
        expect(@hasil).to have_received(:cek_kategori).with(item.id)
        expect(output).to eq(0)
    end
    it "should valid parameter" do
        item = M_category.new('mie',1)
        allow(@hasil).to receive(:cek_valid).with(item.id).and_return({:hasil => false, :pesan => ""})
        output = @hasil.cek_valid(item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id)
        expect(output).to eq({:hasil => false, :pesan => ""})
    end
    it "should exist method delete_kategori" do
        item = M_category.new('mie',1)
        allow(@hasil).to receive(:delete_kategori).with(item.id)
        @hasil.delete_kategori(item.id)
        expect(@hasil).to have_received(:delete_kategori).with(item.id)
    end
end

describe M_db_tambah_kategori do
    it "#tambah_kategori" do
        item = M_category.new('makanan',1)
        query = "insert into categories (name) values ('#{item.name}')"
        mock = double
        allow(Mysql2::Client).to receive(:new).and_return(mock)
        expect(mock).to receive(:query).with(query)
        expect(mock).not_to be_falsey
        M_db_tambah_kategori.new.tambah_kategori(item.name)
    end
    before(:each) do
        @hasil = instance_double(M_db_tambah_kategori)
    end
    it "should blank id" do
        item = M_category.new('',1)
        allow(@hasil).to receive(:cek_valid).with(item.name).and_return({:hasil => true, :pesan => "Nama wajib diisi"})
        output = @hasil.cek_valid(item.name)
        expect(@hasil).to have_received(:cek_valid).with(item.name)
        expect(output).to eq({:hasil => true, :pesan => "Nama wajib diisi"})
    end
    it "should name string" do
        item = M_category.new(1,1)
        allow(@hasil).to receive(:cek_valid).with(item.name).and_return({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
        output = @hasil.cek_valid(item.name)
        expect(@hasil).to have_received(:cek_valid).with(item.name)
        expect(output).to eq({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
    end
    it "should valid parameter" do
        item = M_category.new('makanan',1)
        allow(@hasil).to receive(:cek_valid).with(item.name).and_return({:hasil => false, :pesan => ""})
        output = @hasil.cek_valid(item.name)
        expect(@hasil).to have_received(:cek_valid).with(item.name)
        expect(output).to eq({:hasil => false, :pesan => ""})
    end
    it "should exist method tambah_kategori" do
        item = M_category.new('mie',1)
        allow(@hasil).to receive(:tambah_kategori).with(item.name)
        @hasil.tambah_kategori(item.name)
        expect(@hasil).to have_received(:tambah_kategori).with(item.name)
    end
end

describe M_db_edit_kategori do
    it "#edit_kategori" do
        item = M_category.new('makanan',1)
        query = "update categories set name='#{item.name}' where id=#{item.id} limit 1"
        mock = double
        allow(Mysql2::Client).to receive(:new).and_return(mock)
        expect(mock).to receive(:query).with(query)
        expect(mock).not_to be_falsey
        M_db_edit_kategori.new.edit_kategori(item.id,item.name)
    end
    before(:each) do
        @hasil = instance_double(M_db_edit_kategori)
    end
    it "should blank id" do
        item = M_category.new('makanan','')
        allow(@hasil).to receive(:cek_valid).with(item.name,item.id).and_return({:hasil => true, :pesan => "ID wajib diisi"})
        output = @hasil.cek_valid(item.name,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID wajib diisi"})
    end
    it "should id integer" do
        item = M_category.new('makanan','aaa')
        allow(@hasil).to receive(:cek_valid).with(item.name,item.id).and_return({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.name,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.id)
        expect(output).to eq({:hasil => true, :pesan => "ID harus dalam bentuk angka"})
    end
    it "should id invalid" do
        item = M_category.new('makanan',0)
        allow(@hasil).to receive(:cek_kategori).with(item.id).and_return(0)
        output = @hasil.cek_kategori(item.id)
        expect(@hasil).to have_received(:cek_kategori).with(item.id)
        expect(output).to eq(0)
    end
    it "should blank name" do
        item = M_category.new('',1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.id).and_return({:hasil => true, :pesan => "Nama wajib diisi"})
        output = @hasil.cek_valid(item.name,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.id)
        expect(output).to eq({:hasil => true, :pesan => "Nama wajib diisi"})
    end
    it "should name string" do
        item = M_category.new(1,1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.id).and_return({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
        output = @hasil.cek_valid(item.name,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.id)
        expect(output).to eq({:hasil => true, :pesan => "Nama harus dalam bentuk string"})
    end
    it "should valid parameter" do
        item = M_category.new('makanan',1)
        allow(@hasil).to receive(:cek_valid).with(item.name,item.id).and_return({:hasil => false, :pesan => ""})
        output = @hasil.cek_valid(item.name,item.id)
        expect(@hasil).to have_received(:cek_valid).with(item.name,item.id)
        expect(output).to eq({:hasil => false, :pesan => ""})
    end
    it "should exist method edit_kategori" do
        item = M_category.new('mie',1)
        allow(@hasil).to receive(:edit_kategori).with(item.id,item.name)
        @hasil.edit_kategori(item.id,item.name)
        expect(@hasil).to have_received(:edit_kategori).with(item.id,item.name)
    end
end

describe M_db_delete_kategori_pada_item do
    it "#delete_kategori_pada_item" do
        id_item = 1
        id_kategori = 1
        query = "delete from item_categories where item_id=#{id_item} and category_id=#{id_kategori}"
        mock = double
        allow(Mysql2::Client).to receive(:new).and_return(mock)
        expect(mock).to receive(:query).with(query)
        expect(mock).not_to be_falsey
        M_db_delete_kategori_pada_item.new.delete_kategori_pada_item(id_item,id_kategori)
    end
    before(:each) do
        @hasil = instance_double(M_db_delete_kategori_pada_item)
    end
    it "should blank id item" do
        item = M_item.new('mie',5000,'')
        kategori = M_category.new('makanan',1)
        allow(@hasil).to receive(:cek_valid).with(item.id,kategori.id).and_return({:hasil => true, :pesan => "ID item wajib diisi"})
        output = @hasil.cek_valid(item.id,kategori.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id,kategori.id)
        expect(output).to eq({:hasil => true, :pesan => "ID item wajib diisi"})
    end
    it "should id item integer" do
        item = M_item.new('mie',5000,'aaa')
        kategori = M_category.new('makanan',1)
        allow(@hasil).to receive(:cek_valid).with(item.id,kategori.id).and_return({:hasil => true, :pesan => "ID item harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.id,kategori.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id,kategori.id)
        expect(output).to eq({:hasil => true, :pesan => "ID item harus dalam bentuk angka"})
    end
    it "should id item invalid" do
        item = M_item.new('mie',5000,0)
        kategori = M_category.new('makanan',1)
        allow(@hasil).to receive(:cek_item).with(item.id).and_return(0)
        output = @hasil.cek_item(item.id)
        expect(@hasil).to have_received(:cek_item).with(item.id)
        expect(output).to eq(0)
    end
    it "should blank id kategori" do
        item = M_item.new('mie',5000,1)
        kategori = M_category.new('makanan','')
        allow(@hasil).to receive(:cek_valid).with(item.id,kategori.id).and_return({:hasil => true, :pesan => "ID kategori wajib diisi"})
        output = @hasil.cek_valid(item.id,kategori.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id,kategori.id)
        expect(output).to eq({:hasil => true, :pesan => "ID kategori wajib diisi"})
    end
    it "should id kategori integer" do
        item = M_item.new('mie',5000,1)
        kategori = M_category.new('makanan','aaa')
        allow(@hasil).to receive(:cek_valid).with(item.id,kategori.id).and_return({:hasil => true, :pesan => "ID kategori harus dalam bentuk angka"})
        output = @hasil.cek_valid(item.id,kategori.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id,kategori.id)
        expect(output).to eq({:hasil => true, :pesan => "ID kategori harus dalam bentuk angka"})
    end
    it "should id kategori invalid" do
        item = M_item.new('mie',5000,1)
        kategori = M_category.new('makanan',0)
        allow(@hasil).to receive(:cek_kategori).with(kategori.id).and_return(0)
        output = @hasil.cek_kategori(kategori.id)
        expect(@hasil).to have_received(:cek_kategori).with(kategori.id)
        expect(output).to eq(0)
    end
    it "should valid parameter" do
        item = M_item.new('mie',5000,1)
        kategori = M_category.new('makanan',1)
        allow(@hasil).to receive(:cek_valid).with(item.id,kategori.id).and_return({:hasil => false, :pesan => ""})
        output = @hasil.cek_valid(item.id,kategori.id)
        expect(@hasil).to have_received(:cek_valid).with(item.id,kategori.id)
        expect(output).to eq({:hasil => false, :pesan => ""})
    end
    it "should exist method delete_kategori_pada_item" do
        item = M_item.new('mie',5000,1)
        kategori = M_category.new('makanan',1)
        allow(@hasil).to receive(:delete_kategori_pada_item).with(item.id,kategori.id)
        @hasil.delete_kategori_pada_item(item.id,kategori.id)
        expect(@hasil).to have_received(:delete_kategori_pada_item).with(item.id,kategori.id)
    end
end
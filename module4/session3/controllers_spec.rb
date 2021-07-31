require 'mysql2'
require 'spec_helper'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require "./controllers/c_home"
require "./controllers/c_tambah_item"

describe C_home do
    it "render home" do
        model = M_home.new
        items = model.get_semua_item
        view = ERB.new(File.read("./views/v_home.erb")).result(binding)
        expect(view).not_to be_nil
    end
end

describe C_tambah_item do
    it "render tambah_item" do
        model = M_tambah_item.new
        kategori = model.get_semua_kategori
        view = ERB.new(File.read("./views/v_tambah_item.erb")).result(binding)
        expect(view).not_to be_nil
    end
end
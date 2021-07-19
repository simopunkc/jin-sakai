require 'sinatra'
require './db_connector'

get '/' do
    items = get_all_items
    erb :index, locals: {
        items: items
    }
end

get '/items/new' do
    kategori = get_all_categories()
    erb :create, locals: {
        kategori: kategori
    }
end

post '/items/create' do
    error = nil
    name = params['name']
    price = params['price']
    kategori = params['kategori']
    if name.empty?
        error = "Nama wajib diisi"
    elsif !cek_string?(name)
        error = "Nama harus dalam bentuk string"
    elsif kategori.empty?
        error = "Kategori wajib dipilih"
    elsif !cek_integer?(kategori)
        error = "Kategori tidak valid"
    elsif !cek_kategori(kategori)
        error = "Kategori tidak valid"
    end
    if !price.empty?
        if !cek_integer?(price)
            error = "Price harus dalam bentuk angka"
        end
    end
    if error == nil
        create_new_item(name,price,kategori)
        redirect "/"
    else
        erb :error, locals: {
            error: error
        }
    end
end

post '/items/:id/edit' do
    error = nil
    id = params[:id]
    name = params['name']
    price = params['price']
    kategori = params['kategori']
    if !cek_items(id)
        error = "id tidak valid"
    elsif name.empty?
        error = "Nama wajib diisi"
    elsif !cek_string?(name)
        error = "Nama harus dalam bentuk string"
    elsif kategori.empty?
        error = "Kategori wajib dipilih"
    elsif !cek_integer?(kategori)
        error = "kategori tidak valid"
    elsif !cek_kategori(kategori)
        error = "Kategori tidak valid"
    end
    if !price.empty?
        if !cek_integer?(price)
            error = "Price harus dalam bentuk angka"
        end
    end
    if error == nil
        edit_items(id,name,price,kategori)
        redirect "/"
    else
        erb :error, locals: {
            error: error
        }
    end
end

get '/items/:id/edit' do
    error = nil
    id = params[:id]
    if !cek_items(id)
        error = "id tidak valid"
    end
    if error == nil
        items = single_items(id)
        kategori = get_all_categories()
        erb :edit_item, locals: {
            items: items,
            kategori: kategori
        }
    else
        erb :error, locals: {
            error: error
        }
    end
end

get '/items/:id' do
    error = nil
    id = params[:id]
    if !cek_items(id)
        error = "id tidak valid"
    end
    if error == nil
        items = single_items(id)
        erb :single_item, locals: {
            items: items
        }
    else
        erb :error, locals: {
            error: error
        }
    end
end

get '/items/:id/delete' do
    error = nil
    id = params[:id]
    if !cek_items(id)
        error = "id tidak valid"
    end
    if error == nil
        delete_items(id)
        redirect "/"
    else
        erb :error, locals: {
            error: error
        }
    end
end
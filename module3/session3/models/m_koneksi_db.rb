module M_koneksi_db
    def buat_koneksi_db
        client = Mysql2::Client.new(
            :host => ENV['RUBY_PROD_DB_HOST'],
            :username => ENV['RUBY_PROD_USER'],
            :password => ENV['RUBY_PROD_PASS'],
            :database => ENV['RUBY_PROD_DB']
        )
        client
    end
end
class C_tambah_kategori
    def self.cetak_tambah_kategori
        view = ERB.new(File.read("./views/v_tambah_kategori.erb"))
        view.result(binding)
    end
end
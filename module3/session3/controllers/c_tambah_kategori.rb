class C_tambah_kategori
    def self.cetak_tambah_kategori
        view = ERB.new(File.read(FOLDER_TEMPLATE + "/v_tambah_kategori.erb"))
        view.result(binding)
    end
end
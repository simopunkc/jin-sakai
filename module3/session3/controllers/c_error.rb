class C_error
    def self.cetak_error(output)
        view = ERB.new(File.read(FOLDER_TEMPLATE + "/v_error.erb"))
        view.result(binding)
    end
end
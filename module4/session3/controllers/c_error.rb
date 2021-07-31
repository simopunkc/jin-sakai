class C_error
    def self.cetak_error(output)
        view = ERB.new(File.read("./views/v_error.erb"))
        view.result(binding)
    end
end
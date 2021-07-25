class C_header
    def self.cetak_header
        view = ERB.new(File.read("./views/appshell/v_header.erb"))
        view.result(binding)
    end
end
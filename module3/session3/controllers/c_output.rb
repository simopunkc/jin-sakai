class C_output
    def self.cetak_output(output)
        view = ERB.new(File.read(FOLDER_TEMPLATE+"/v_output.erb"))
        view.result(binding)
    end
end
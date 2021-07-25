class C_output
    def self.cetak_output(output)
        view = ERB.new(File.read("./views/v_output.erb"))
        view.result(binding)
    end
end
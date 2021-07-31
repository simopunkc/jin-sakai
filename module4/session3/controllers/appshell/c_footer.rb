class C_footer
    def self.cetak_footer
        view = ERB.new(File.read("./views/appshell/v_footer.erb"))
        view.result(binding)
    end
end
class C_css_main
    def self.cetak_css
        view = ERB.new(File.read("./views/css/v_css_main.erb"))
        view.result(binding)
    end
end
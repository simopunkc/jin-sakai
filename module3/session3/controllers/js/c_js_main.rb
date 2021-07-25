class C_js_main
    def self.cetak_js
        view = ERB.new(File.read(FOLDER_TEMPLATE+"/js/v_js_main.erb"))
        view.result(binding)
    end
end
class C_footer
    def self.cetak_footer
        view = ERB.new(File.read(FOLDER_TEMPLATE+"/appshell/v_footer.erb"))
        view.result(binding)
    end
end
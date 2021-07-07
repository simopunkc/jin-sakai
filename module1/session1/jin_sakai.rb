require "./pemain_ec"

pemain1 = Pemain_EpicComeback.new()
pemain1.name = "Jin Sakai"
pemain1.set_hitpoint(100)
pemain1.set_damage(50)
pemain2 = Pemain.new()
pemain2.name = "Khotun Khan"
pemain2.set_hitpoint(500)
pemain2.set_damage(50)

giliran_pemain1 = true
while pemain1.masih_hidup? and pemain2.masih_hidup?
    if giliran_pemain1
        pemain1.serang(pemain2)
    else
        pemain2.serang(pemain1)
    end
    giliran_pemain1 = !giliran_pemain1
    puts "\n"
end

if pemain1.masih_hidup?
    puts "Khotun Khan dies"
else
    puts "Jin Sakai dies"
end
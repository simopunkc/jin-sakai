require "./pahlawan"
require "./sekutu"
require "./musuh"
require "./teknik_musuh"

pemain1 = Pahlawan.new("Jin Sakai",100,50)
pemain2 = Sekutu.new("Yuna",90,45)
pemain3 = Sekutu.new("Sensei Ishihara",80,60)
hero = [pemain1,pemain2,pemain3]
sekutu = [pemain2,pemain3]
teknik1 = Archer.new
teknik2 = Spearman.new
teknik3 = Swordsman.new
musuh1 = Musuh.new("Mongol Archer",80,40)
musuh1.set_teknik(teknik1)
musuh2 = Musuh.new("Mongol Spearman",120,60)
musuh2.set_teknik(teknik2)
musuh3 = Musuh.new("Mongol Swordsman",100,50)
musuh3.set_teknik(teknik3)
musuh = [musuh1, musuh2, musuh3]

i = 1
until pemain1.meninggal? || musuh.empty? do
    puts "========== Turn #{i} ==========\n"
    if !pemain1.meninggal?
        pemain1.status
    end
    sekutu.each do |teman|
        teman.status
    end
    musuh.each do |lawan|
        lawan.status
    end
    puts "\n"
    if !pemain1.meninggal?
        pilihan1 = 1
        pilihan2 = 1
        loop do
            puts "As Jin Sekai, what do you want to do this turn?"
            puts "1) Attack Archer"
            puts "2) Heal an ally"
            pilihan1 = gets.chomp.to_i
            if pilihan1.between?(1,2)
                case pilihan1
                when 1
                    loop do
                        puts "Which enemy you want to attack?"
                        a = 1
                        musuh.each do |lawan|
                            puts "#{a}) #{lawan.name}"
                            a += 1
                        end
                        pilihan2 = gets.chomp.to_i
                        if pilihan2.between?(1,musuh.size)
                            break
                        end
                    end
                    break
                when 2
                    if !sekutu.empty?
                        loop do
                            puts "Which ally you want to heal?"
                            b = 1
                            sekutu.each do |teman|
                                puts "#{b}) #{teman.name}"
                                b += 1
                            end
                            pilihan2 = gets.chomp.to_i
                            if pilihan2.between?(1,sekutu.size)
                                break
                            end
                        end
                    else
                        puts "All allies defeated"
                    end
                    break
                end
            end
        end
        if pilihan1 == 1
            target = musuh[pilihan2-1]
            pemain1.serang(target)
            musuh.delete(target) if target.meninggal? || target.get_kabur?
        else
            target = sekutu[pilihan2-1]
            pemain1.sembuhkan(target)
        end
    end
    sekutu.each do |teman|
        acak = rand(musuh.size)
        target2 = musuh[acak]
        teman.serang(target2)
        musuh.delete(target2) if target2.meninggal? || target2.get_kabur?
    end
    puts "\n"
    musuh.each do |lawan|
        acak = rand(hero.size)
        target3 = hero[acak]
        lawan.serang(target3)
        hero.delete(target3) if target3.meninggal?
        if acak > 0
            target4 = sekutu[acak-1]
            sekutu.delete(target4) if target4.meninggal?
        end
    end
    puts "\n"
    if musuh.size == 0
        puts "All villains defeated"
        break
    elsif pemain1.meninggal?
        puts "Jin Sakai dies"
        break
    else
        i += 1
    end
end
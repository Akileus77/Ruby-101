ad = Array.new
soyad = Array.new
telefon = Array.new
adres = Array.new

File.open('ad.txt', 'a+') do |f|
  f.each_line do |line|
    ad.insert(-1,line.to_s)
  end
end

File.open('soyad.txt', 'a+') do |f|
  f.each_line do |line|
    soyad.insert(-1,line.to_s)
  end
end

File.open('telefon.txt', 'a+') do |f|
  f.each_line do |line|
    telefon.insert(-1,line.to_s)
  end
end

File.open('adres.txt', 'a+') do |f|
  f.each_line do |line|
    adres.insert(-1,line.to_s)
  end
end

greeting = "- Varolan kayıtları görüntülemek için 'görüntüle'
- Kayıt eklemek için 'ekle'
- Kayıtlarda arama yapmak için 'ara'
- Kayıt silmek için 'sil'
- Çok önemli bir mesaji görüntülemek için 'mesaj'
- Bu mesaji tekrar görüntülemek için 'yardım'
- Çıkış yapmak için 'çıkış'
yaziniz.\n"

puts "Berkenin rehberine hoşgeldiniz! (v0.2)"
puts "Aşağida belirtilen komutlarla isleminizi gerçekleştirebilirsiniz."
puts greeting

continue = true

while continue == true do

  choice = gets.chomp

  if choice == "görüntüle"
    if ad.length == 0
      puts "Herhangi bir kayıt yok. kayıt eklemek için \"ekle\" komutunu kullanabilirsiniz."
    elsif
      for i in 0..ad.length-1 do
        puts "#{i+1}. sıradaki kayıt:"
        print "İsim\t:", ad.at(i)
        print "Soyisim\t:", soyad.at(i)
        print "Telefon\t:", telefon.at(i)
        print "Adres\t:", adres.at(i),"\n"
      end
    end

  elsif choice == "ekle"

    puts "Eklemek istediğiniz kayıt için ad giriniz"
    adInput = gets
    ad.insert(-1,adInput.to_s)
    File.open('ad.txt','a') do |f|
      f.puts "#{adInput}"
    end

    puts "Eklemek istediğiniz kayıt için soyad giriniz"
    soyadInput = gets
    soyad.insert(-1,soyadInput.to_s)
    File.open('soyad.txt','a') do |f|
      f.puts "#{soyadInput}"
    end

    puts "Eklemek istediğiniz kayıt için telefon giriniz"
    telefonInput = gets
    telefon.insert(-1,telefonInput.to_s)
    File.open('telefon.txt','a') do |f|
      f.puts "#{telefonInput}"
    end

    puts "Eklemek istediğiniz kayıt için adres giriniz"
    adresInput = gets
    adres.insert(-1,adresInput.to_s)
    File.open('adres.txt','a') do |f|
      f.puts "#{adresInput}"
    end

    puts "Adres eklendi!"

  elsif choice == "ara"

    found = false
    sayac = 1
    puts "Aramak istediğiniz kayıtın ad, soyad, telefon veya adresini giriniz:"
    aranan = gets.chomp.to_s.downcase
    for i in 0..ad.length-1 do
      if (ad.at(i).include? aranan) || (soyad.at(i).include? aranan) || (telefon.at(i).include? aranan) || (adres.at(i).include? aranan)
        puts "#{sayac}. eşleşen kayıt:"
        print "Sıra no\t:", i+1, "\n"
        print "İsim\t:", ad.at(i)
        print "Soyisim\t:", soyad.at(i)
        print "Telefon\t:", telefon.at(i)
        print "Adres\t:", adres.at(i), "\n"
        found = true
        sayac += 1
      end
    end

    if found == false
      puts "\nkayıt bulunamadı."
    end

  elsif choice == "sil"

    permission = false
    puts "Silmek istediğiniz kayıta ait sira numarasını giriniz:"
    numara = gets.chomp.to_i
    puts "Silmek istediğiniz kayıt bu mu?"
    print "İsim\t:", ad.at(numara-1)
    print "Soyisim\t:", soyad.at(numara-1)
    print "Telefon\t:", telefon.at(numara-1)
    print "Adres\t:", adres.at(numara-1), "\n"
    puts "Eğer silmek istediğinizden eminseniz \"evet\" yazınız"
    onay = gets.chomp

    if onay == "evet"
      permission = true
    end

    if permission == true
      ad.delete_at(numara-1)
      soyad.delete_at(numara-1)
      telefon.delete_at(numara-1)
      adres.delete_at(numara-1)

      if ad.length >= 1
        for i in 0..ad.length-1 do
          File.open('ad_temp.txt','a') do |f|
            f.puts "#{ad.at(i)}"
          end
          File.open('soyad_temp.txt','a') do |f|
            f.puts "#{soyad.at(i)}"
          end
          File.open('telefon_temp.txt','a') do |f|
            f.puts "#{telefon.at(i)}"
          end
          File.open('adres_temp.txt','a') do |f|
            f.puts "#{adres.at(i)}"
          end
        end

        File.delete("ad.txt")
        File.delete("soyad.txt")
        File.delete("telefon.txt")
        File.delete("adres.txt")

        File.rename("ad_temp.txt", "ad.txt")
        File.rename("soyad_temp.txt", "soyad.txt")
        File.rename("telefon_temp.txt", "telefon.txt")
        File.rename("adres_temp.txt", "adres.txt")

      elsif ad.length == 0

        File.delete("ad.txt")
        File.delete("soyad.txt")
        File.delete("telefon.txt")
        File.delete("adres.txt")

        File.open('ad.txt', 'a+')
        File.open('soyad.txt', 'a+')
        File.open('telefon.txt', 'a+')
        File.open('adres.txt', 'a+')
      end

      puts "Kayıt başarıyla silindi"

    else
      puts "Kayıt silinmedi"
    end

  elsif choice == "mesaj"

    puts "Önce pull, sonra push ;)"

  elsif choice == "yardım"

    puts greeting

  elsif choice == "çıkış"

    puts "İyi günler!"
    continue = false

  elsif
    puts "Gecersiz bir komut girdiniz."
  end
end

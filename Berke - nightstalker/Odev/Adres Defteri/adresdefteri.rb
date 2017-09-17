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

greeting = "- Varolan kayitlari goruntulemek icin 'goruntule'
- Kayit eklemek icin 'ekle'
- Kayitlarda arama yapmak icin 'ara'
- Kayit silmek icin 'sil'
- Cok onemli bir mesaji goruntulemek icin 'mesaj'
- Bu mesaji tekrar goruntulemek icin 'yardim'
- Cikis yapmak icin 'cikis'
yaziniz.\n"

puts "Berkenin rehberine hosgeldiniz! (v0.1)"
puts "Asagida belirtilen komutlarla isleminizi gerceklestirebilirsiniz."
puts greeting

continue = true

while continue == true do

  choice = gets.chomp

  if choice == "goruntule"
    if ad.length == 0
      puts "Herhangi bir kayit yok. Kayit eklemek icin \"ekle\" komutunu kullanabilirsiniz."
    elsif
      for i in 0..ad.length-1 do
        puts "#{i+1}. siradaki kayit:"
        print "Isim\t:", ad.at(i)
        print "Soyisim\t:", soyad.at(i)
        print "Telefon\t:", telefon.at(i)
        print "Adres\t:", adres.at(i),"\n"
      end
    end

  elsif choice == "ekle"

    puts "Eklemek istediginiz kayit icin ad giriniz"
    adInput = gets
    ad.insert(-1,adInput.to_s)
    File.open('ad.txt','a') do |f|
      f.puts "#{adInput}"
    end

    puts "Eklemek istediginiz kayit icin soyad giriniz"
    soyadInput = gets
    soyad.insert(-1,soyadInput.to_s)
    File.open('soyad.txt','a') do |f|
      f.puts "#{soyadInput}"
    end

    puts "Eklemek istediginiz kayit icin telefon giriniz"
    telefonInput = gets
    telefon.insert(-1,telefonInput.to_s)
    File.open('telefon.txt','a') do |f|
      f.puts "#{telefonInput}"
    end

    puts "Eklemek istediginiz kayit icin adres giriniz"
    adresInput = gets
    adres.insert(-1,adresInput.to_s)
    File.open('adres.txt','a') do |f|
      f.puts "#{adresInput}"
    end

    puts "Adres eklendi!"

  elsif choice == "ara"

    found = false
    sayac = 1
    puts "Aramak istediginiz ad, soyad, telefon veya adresini giriniz:"
    aranan = gets.chomp.to_s.downcase
    for i in 0..ad.length-1 do
      if (ad.at(i).include? aranan) || (soyad.at(i).include? aranan) || (telefon.at(i).include? aranan) || (adres.at(i).include? aranan)
        puts "#{sayac}. eslesen kayit:"
        print "Sira no\t:", i+1, "\n"
        print "Isim\t:", ad.at(i)
        print "Soyisim\t:", soyad.at(i)
        print "Telefon\t:", telefon.at(i)
        print "Adres\t:", adres.at(i), "\n"
        found = true
        sayac += 1
      end
    end

    if found == false
      puts "\nKayit bulunamadi."
    end

  elsif choice == "sil"

    permission = false
    puts "Silmek istediginiz kayita ait sira numarasini giriniz:"
    numara = gets.chomp.to_i
    puts "Silmek istediginiz kayit bu mu?"
    print "Isim\t:", ad.at(numara-1)
    print "Soyisim\t:", soyad.at(numara-1)
    print "Telefon\t:", telefon.at(numara-1)
    print "Adres\t:", adres.at(numara-1), "\n"
    puts "Eger silmek istediginizden eminseniz \"evet\" yaziniz"
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

      puts "Kayit basariyla silindi"

    else
      puts "Kayit silinmedi"
    end

  elsif choice == "mesaj"

    puts "Once pull, sonra push ;)"

  elsif choice == "yardim"

    puts greeting

  elsif choice == "cikis"

    puts "Iyi gunler!"
    continue = false

  elsif
    puts "Gecersiz bir komut girdiniz."
  end
end

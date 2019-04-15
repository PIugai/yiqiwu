require 'faker'

p "cleaning database"
Booking.destroy_all
Event.destroy_all
User.destroy_all

# make 300 USERS
300.times do
  first_name = Faker::Name.first_name
  last_name = %w(Wang Li Zhang Liu Chen Yang Huang Zhao Wu Zhou Xu Sun Ma Zhu Hu Guo He Gao Lin Luo Zheng Liang Xie Song Tang Xu Han Feng Deng Cao Peng Zeng Xiao Tian Dong Yuan Pan Yu Jiang Cai Yu Du Ye Cheng Su Wei Lu Ding Ren Shen Yao Lu Jiang Cui Zhong Tan Lu Wang Fan Jin Kong Wang Li Zhang Liu Chen Yang Huang Zhao Wang Li).sample
  name = "#{first_name} #{last_name}"

  randomdim = [90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100].sample
  photo = Faker::LoremPixel.image("#{randomdim}x#{randomdim}", false, 'people')

  fake_des1 = Faker::GreekPhilosophers.quote
  fake_des2 = Faker::Quote.famous_last_words
  fake_des3 = Faker::Quotes::Shakespeare.hamlet_quote
  fake_des4 = Faker::Quotes::Shakespeare.as_you_like_it_quote
  fake_des5 = Faker::Quotes::Shakespeare.king_richard_iii_quote
  fake_des6 = Faker::Quotes::Shakespeare.romeo_and_juliet_quote

  description = [fake_des1, fake_des2, fake_des3, fake_des4, fake_des5, fake_des6].sample

  new_user = User.create(name: name, photo: photo, description: description)
end
p "#{User.all.count} users created"


# make 50 EVENTS in Shanghai
50.times do
  # random_type = ["Fan Dance", "Sword Dance", "Peacock Dance", "Folk Dance", "Ballet", "Exercise Dance"].sample
  random_type = ["Kites", "Dance", "Spinning Top", "Taichi", "Wushu", "Sword Dance", "Chinese Chess", "Water Calligraphy"].sample

  random_capacity = [5,8,10,15,20,25,30,35,40,45,50].sample

  description = "#{random_type} is #{Faker::Marketing.buzzwords}. #{Faker::GreekPhilosophers.quote}"

  start_time = Faker::Time.forward(60, :evening)
  start_time = start_time - start_time.min*60 - start_time.sec

  park_lat_long_array = [[31.221812022739826, 121.44771237865449, "Jingan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/c046e3f39333655d4730/jing6.jpg"],
  [31.221628523633207, 121.446725325737, "Jingan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/1b4d15334a0c7bb2b868/jing1.jpg"],
  [31.221623936151026, 121.44597967163087, "Jingan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/e9173c1ed6ecd0a3946c/jing2.jpg"],
  [31.222142320234745, 121.44583483234406, "Jingan Park", "http://lc-odcccsle.cn-n1.lcfile.com/d3ecf38098ac5d10b75f/jing5.jpg"],
  [31.222325818344327, 121.4462747146225, "Jingan Park", "http://lc-odcccsle.cn-n1.lcfile.com/d3ecf38098ac5d10b75f/jing5.jpg"],
  [31.222243244239227, 121.44675214782715, "Jingan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/84a06e45fb6b09ea1989/jing3.jpg"],
  [31.222353343030107, 121.44726713195801, "Jingan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/ce4b9e9c30044869fee4/jing4.jpg"],
  [31.219831733281726, 121.41998280499266, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/2b06abe54ac0922fb8c8/zh5.jpg"],
  [31.221960341481683, 121.41688217137144, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/2d91a7b7b04b0b8aaea9/zh1.jpg"],
  [31.220106987040314, 121.4217208764343, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/45985621e3a4748690ee/zh6.jpg"],
  [31.221217169064616, 121.42131318066404, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/e281e21292222919be30/zh2.jpg"],
  [31.22178601761188, 121.41894210789488, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/ef989638adcda3fe41c2/zh3.jpg"],
  [31.22309802620767, 121.41868461582945, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/053a9b66e9594037f1d6/zh7.jpg"],
  [31.222868655389203, 121.41767610523985, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/9d81da07bd0b23344c61/zh4.jpg"],
  [31.23074034361628, 121.47183526966856, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4c1e70e2c77105f13cf6/rm1.jpg"],
  [31.231529311177816, 121.4712129971771, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/2ef2a165a33af6ef7828/rm6.jpg"],
  [31.232143967387096, 121.47204984638975, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/fa3e81db0f485bd151b7/rm5.jpg"],
  [31.23185040074124, 121.47307981465147, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/f535f482ee4f59355d5a/rm3.jpg"],
  [31.23185040074124, 121.47476424191282, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/398e4917a0a7040b0954/rm7.jpg"],
  [31.232676054608152, 121.47454966519163, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/765a584fc5cc28553d2f/rm2.jpg"],
  [31.233070531131226, 121.4729403397827, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/626fdbddc96ac5e92ca5/rm4.jpg"],
  [31.215799173847742, 121.46879364464567, "Fuxin Park", "http://lc-odcccsle.cn-n1.lcfile.com/d477338be7541e2a6b0b/fx6.jpg"],
  [31.217363588772322, 121.46989335034178, "Fuxin Park", "http://lc-odcccsle.cn-n1.lcfile.com/d7cf751ee755a96b969d/fx5.jpg"],
  [31.216946108143315, 121.4689062974243, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/d856d8c77e6602f0f5ed/fx3.jpg"],
  [31.217024099170438, 121.46798361752317, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/874597a2a133f41320ef/fx2.jpg"],
  [31.217978337112957, 121.46796752426908, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/69c71dc9abff404781b1/fx7.jpg"],
  [31.21813890505086, 121.46904577229307, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/1bba78b136ab841ba6bc/fx4.jpg"],
  [31.19751516292136, 121.44373108361052, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4b9c071d5d25472aa0b2/xjh1.jpg"],
  [31.197226077405556, 121.44286741230772, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/dff75bbedb80715efa68/xjh6.jpg"],
  [31.196528597604093, 121.44277621720121, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/1d1a62f9a3ac261e5f89/xjh3.jpg"],
  [31.19577604784158, 121.4413868329315, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4c2cb168b984551dcfb0/xjh5.jpg"],
  [31.196386347803173, 121.44074310276793, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/b3e3f0f67fa84b56a8f3/xjh2.jpg"],
  [31.19703335323827, 121.44193400357054, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/e5f3ef8454158faae727/xjh7.jpg"],
  [31.197818013467682, 121.44237925026701, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/0760f386bcec3250cbc3/xjh4.jpg"],
  [31.21328963308892, 121.54558528874205, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/d5106f50b6ffb388a75d/cp2.jpg"],
  [31.21212430266809, 121.54891122792051, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/018943fa73ec686e09ab/cp7.jpg"],
  [31.212528040818004, 121.55201186154173, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/442b32548b0d0df6c28c/cp6.jpg"],
  [31.213730069193968, 121.55434001896666, "Century Park", "http://lc-odcccsle.cn-n1.lcfile.com/4dcbbf58a6f8e94cf4ed/cp4.jpg"],
  [31.215372510743585, 121.55917872402952, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4f3271f49e75dd0c7e7e/cp5.jpg"],
  [31.217400290281788, 121.557644500473, "Century Park", "http://lc-odcccsle.cn-n1.lcfile.com/fff5a045a7d8b4e949e9/cp1.jpg"],
  [31.218950915877016, 121.55369628880308, "Century Park", "http://lc-odcccsle.cn-n1.lcfile.com/6aea489fe95add83d605/cp3.jpg"]]

  latlong = park_lat_long_array.sample
  latitude = latlong[0]
  longitude = latlong[1]
  photo = latlong[3]

  new_event = Event.create(user: User.all.sample, activity_type: random_type, capacity: random_capacity, description: description, start_time: start_time, end_time: start_time + [60*60,90*60,120*60].sample, location: latlong[2], latitude: latitude, longitude: longitude)
end
  p "#{Event.all.count} events created"

# make bookings for each event
Event.all.each do |event|
  rand(0..event.capacity).times do
    attendance = [true, false].sample
    new_booking = Booking.create(user: User.all.sample, event: event, attendance: attendance)
    descriptor = %w(liked loved enjoyed).sample
    new_booking.review = "I #{descriptor} this #{new_booking.event.activity_type} event very much"
    new_booking.save
  end
end
p "#{Booking.all.count} bookings created"

# update spots filled
Event.all.each do |event|
  event.spots_filled = event.bookings.count
  event.save
end
p "Each event's 'spots_filled' updated with number of users that booked it"

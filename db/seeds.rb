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
  [31.224505, 121.414189, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/2b06abe54ac0922fb8c8/zh5.jpg"],
  [31.224670, 121.411722, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/2d91a7b7b04b0b8aaea9/zh1.jpg"],
  [31.223331, 121.411551, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/45985621e3a4748690ee/zh6.jpg"],
  [31.224028, 121.415754, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/e281e21292222919be30/zh2.jpg"],
  [31.221789, 121.415733, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/ef989638adcda3fe41c2/zh3.jpg"],
  [31.224523, 121.415347, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/053a9b66e9594037f1d6/zh7.jpg"],
  [31.224663, 121.412670, "Zhongshan Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/9d81da07bd0b23344c61/zh4.jpg"],
  [31.234470, 121.467999, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4c1e70e2c77105f13cf6/rm1.jpg"],
  [31.233507, 121.468814, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/2ef2a165a33af6ef7828/rm6.jpg"],
  [31.233608, 121.467002, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/fa3e81db0f485bd151b7/rm5.jpg"],
  [31.234085, 121.470241, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/f535f482ee4f59355d5a/rm3.jpg"],
  [31.233828, 121.469779, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/398e4917a0a7040b0954/rm7.jpg"],
  [31.233434, 121.469007, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/765a584fc5cc28553d2f/rm2.jpg"],
  [31.232342, 121.467549, "Renmin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/626fdbddc96ac5e92ca5/rm4.jpg"],
  [31.219764, 121.463517, "Fuxin Park", "http://lc-odcccsle.cn-n1.lcfile.com/d477338be7541e2a6b0b/fx6.jpg"],
  [31.220076, 121.463903, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/b3fc355a58bb7b10979e/fx1.jpg"],
  [31.219975, 121.464751, "Fuxin Park", "http://lc-odcccsle.cn-n1.lcfile.com/d7cf751ee755a96b969d/fx5.jpg"],
  [31.219571, 121.465169, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/d856d8c77e6602f0f5ed/fx3.jpg"],
  [31.219443, 121.464461, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/874597a2a133f41320ef/fx2.jpg"],
  [31.219415, 121.463850, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/69c71dc9abff404781b1/fx7.jpg"],
  [31.218874, 121.463689, "Fuxin Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/1bba78b136ab841ba6bc/fx4.jpg"],
  [31.200540, 121.437952, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4b9c071d5d25472aa0b2/xjh1.jpg"],
  [31.200586, 121.438465, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/dff75bbedb80715efa68/xjh6.jpg"],
  [31.200209, 121.438776, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/1d1a62f9a3ac261e5f89/xjh3.jpg"],
  [31.200053, 121.438111, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4c2cb168b984551dcfb0/xjh5.jpg"],
  [31.199796, 121.437435, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/b3e3f0f67fa84b56a8f3/xjh2.jpg"],
  [31.199310, 121.437157, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/e5f3ef8454158faae727/xjh7.jpg"],
  [31.199154, 121.438218, "Xujiahui Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/0760f386bcec3250cbc3/xjh4.jpg"],
  [31.216684, 121.539597, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/d5106f50b6ffb388a75d/cp2.jpg"],
  [31.215436, 121.541485, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/018943fa73ec686e09ab/cp7.jpg"],
  [31.214518, 121.544874, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/442b32548b0d0df6c28c/cp6.jpg"],
  [31.215730, 121.548005, "Century Park", "http://lc-odcccsle.cn-n1.lcfile.com/4dcbbf58a6f8e94cf4ed/cp4.jpg"],
  [31.216427, 121.551180, "Century Park", "http://lc-OdCCcsLE.cn-n1.lcfile.com/4f3271f49e75dd0c7e7e/cp5.jpg"],
  [31.216317, 121.553582, "Century Park", "http://lc-odcccsle.cn-n1.lcfile.com/fff5a045a7d8b4e949e9/cp1.jpg"],
  [31.219363, 121.546871, "Century Park", "http://lc-odcccsle.cn-n1.lcfile.com/6aea489fe95add83d605/cp3.jpg"]]

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

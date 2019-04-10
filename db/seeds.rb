require 'faker'

# USERS
# name
# photo
# wechat_id
# description
# latitude
# longitude

# EVENTS
# user_id*
# activity_type*
# capacity
# spots_filled
# description
# start_time*
# end_time*
# location*
# latitude
# longitude
# photo

# BOOKINGS
# user_id*
# event_id*
# attendance
# review
p "cleaning database"
User.destroy_all
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
p "300 users created"


# make 50 EVENTS in Shanghai
50.times do
  random_type = ["Taichi", "Dance", "Wushu", "Sword Dance", "Chinese Chess", "Water Calligraphy", "Kites", "Spinning Top"].sample
  random_capacity = [5,8,10,15,20,25,30,35,40,45,50].sample

  description = "#{random_type} is #{Faker::Marketing.buzzwords}. #{Faker::GreekPhilosophers.quote}"

  year = Time.now.year
  month = Time.now.month
  if Time.now.day < 22
    day_within_week = Time.now.day + rand(1..7)
  else
    day_within_week = Time.now.day + 1
  end
  start_hour = [6, 7, 8, 18, 19, 20].sample
  start_min = [0, 15, 30, 45].sample

  random_time = Time.new(year, month, day_within_week, start_hour, start_min)

  park_lat_long_array = [[31.224013, 121.441312, "Jingan Park"],
  [31.223481, 121.441167, "Jingan Park"],
  [31.223357, 121.441709, "Jingan Park"],
  [31.223692, 121.442824, "Jingan Park"],
  [31.224086, 121.441821, "Jingan Park"],
  [31.224265, 121.442465, "Jingan Park"],
  [31.223834, 121.443038, "Jingan Park"],
  [31.223719, 121.442068, "Jingan Park"],
  [31.224505, 121.414189, "Zhongshan Park"],
  [31.224670, 121.411722, "Zhongshan Park"],
  [31.223331, 121.411551, "Zhongshan Park"],
  [31.224028, 121.415754, "Zhongshan Park"],
  [31.221789, 121.415733, "Zhongshan Park"],
  [31.224523, 121.415347, "Zhongshan Park"],
  [31.224663, 121.412670, "Zhongshan Park"],
  [31.224461, 121.412681, "Zhongshan Park"],
  [31.222764, 121.413946, "Zhongshan Park"],
  [31.222158, 121.414321, "Zhongshan Park"],
  [31.222388, 121.415694, "Zhongshan Park"],
  [31.224149, 121.411244, "Zhongshan Park"],
  [31.223489, 121.411258, "Zhongshan Park"],
  [31.222901, 121.411837, "Zhongshan Park"],
  [31.224195, 121.416674, "Zhongshan Park"],
  [31.223782, 121.415859, "Zhongshan Park"],
  [31.234470, 121.467999, "Renmin Park"],
  [31.233507, 121.468814, "Renmin Park"],
  [31.233608, 121.467002, "Renmin Park"],
  [31.234085, 121.470241, "Renmin Park"],
  [31.233828, 121.469779, "Renmin Park"],
  [31.233434, 121.469007, "Renmin Park"],
  [31.232342, 121.467549, "Renmin Park"],
  [31.219764, 121.463517, "Fuxin Park"],
  [31.220076, 121.463903, "Fuxin Park"],
  [31.219975, 121.464751, "Fuxin Park"],
  [31.219571, 121.465169, "Fuxin Park"],
  [31.219443, 121.464461, "Fuxin Park"],
  [31.219415, 121.463850, "Fuxin Park"],
  [31.218874, 121.463689, "Fuxin Park"],
  [31.218773, 121.464397, "Fuxin Park"],
  [31.218378, 121.465437, "Fuxin Park"],
  [31.218305, 121.464815, "Fuxin Park"],
  [31.217947, 121.464021, "Fuxin Park"],
  [31.217947, 121.464021, "Fuxin Park"],
  [31.200540, 121.437952, "Xujiahui Park"],
  [31.200586, 121.438465, "Xujiahui Park"],
  [31.200209, 121.438776, "Xujiahui Park"],
  [31.200053, 121.438111, "Xujiahui Park"],
  [31.199796, 121.437435, "Xujiahui Park"],
  [31.199310, 121.437157, "Xujiahui Park"],
  [31.199154, 121.438218, "Xujiahui Park"],
  [31.199126, 121.439173, "Xujiahui Park"],
  [31.198539, 121.436674, "Xujiahui Park"],
  [31.216684, 121.539597, "Century Park"],
  [31.215436, 121.541485, "Century Park"],
  [31.214518, 121.544874, "Century Park"],
  [31.215730, 121.548005, "Century Park"],
  [31.216427, 121.551180, "Century Park"],
  [31.216317, 121.553582, "Century Park"],
  [31.221932, 121.554912, "Century Park"],
  [31.222336, 121.551933, "Century Park"],
  [31.219363, 121.546871, "Century Park"]]

  latlong = park_lat_long_array.sample
  latitude = latlong[0]
  longitude = latlong[1]
  # photo =

  new_event = Event.create(user: User.all.sample, activity_type: random_type, capacity: random_capacity, description: description, start_time: random_time, end_time: random_time + [60*60,90*60,120*60].sample, location: latlong[2], latitude: latitude, longitude: longitude)
end
  p "50 events created"

# make 5-20 bookings per event
Event.all.each do |event|
  rand(5..20).times do
    attendance = [true, false].sample
    new_booking = Booking.create(user: User.all.sample, event: Event.all.sample, attendance: attendance)
    descriptor = %w(liked loved enjoyed).sample
    new_booking.review = "I #{descriptor} this #{new_booking.event.activity_type} event very much"
    new_booking.save
  end
end
p "5-20 bookings per event created (total #{Booking.count} bookings)"

# update spots filled
Event.all.each do |event|
  event.spots_filled = event.bookings.count
  event.save
end
p "Each event's 'spots_filled' updated with number of users that booked it"

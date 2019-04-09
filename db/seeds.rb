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
# type*
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


# make 300 USERS
300.times do
  first_name = Faker::Name.first_name
  last_name = %w(Wang Li Zhang Liu Chen Yang Huang Zhao Wu Zhou Xu Sun Ma Zhu Hu Guo He Gao Lin Luo Zheng Liang Xie Song Tang Xu Han Feng Deng Cao Peng Zeng Xiao Tian Dong Yuan Pan Yu Jiang Cai Yu Du Ye Cheng Su Wei Lu Ding Ren Shen Yao Lu Jiang Cui Zhong Tan Lu Wang Fan Jin Kong Wang Li Zhang Liu Chen Yang Huang Zhao Wang Li).sample
  name = "#{first_name} #{last_name}"

  randomdim = [90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100].sample
  photo = Faker::LoremPixel.image("#{randomdim}x#{randomdim}", false, 'people')

  description = (Faker::GreekPhilosophers.quote, Faker::Quote.famous_last_words, Faker::Quotes::Shakespeare.hamlet_quote, Faker::Quotes::Shakespeare.as_you_like_it_quote, Faker::Quotes::Shakespeare.king_richard_iii_quote, Faker::Quotes::Shakespeare.romeo_and_juliet_quote).sample

  new_user = User.create(name: name, photo: photo, description: description)
end


# make 50 EVENTS in Shanghai
50.times do
  # below references using instance of User instead of user_id
  random_type = ["Taichi", "Dance", "Wushu", "Sword Dance", "Chinese Chess", "Water Calligraphy", "Kites", "Spinning Top"].sample
  random_capacity = [5,8,10,15,20,25,30,35,40,45,50].sample

  # spots_filled =

  description = "#{random_type} is #{Faker::Marketing.buzzwords}. #{Faker::GreekPhilosophers.quote}"

  random_time = Time.new(Time.now.year, Time.now.month, Time.now.day+1, [6, 7, 8, 18, 19, 20].sample, [0, 15, 30, 45].sample, 0, "+08:00")

  # temporary location
  rand_location = %w(ZhongshanPark CenturyPark XiangYangPark ChangshouPark).sample

  # latitude =
  # longitude =
  # photo =

  new_event = Event.create(user: User.all.sample, type: random_type, capacity: random_capacity, description: description, start_time: random_time, end_time: random_time + [60*60,90*60,120*60].sample, location: rand_location)
end


# make 5-20 bookings per event
Event.all.each do |event|
    # below references using instance of User instead of user_id
  new_booking = Booking.create(user: User.all.sample, event: Event.all.sample)
end

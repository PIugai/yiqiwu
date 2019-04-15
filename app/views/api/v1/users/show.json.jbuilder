json.extract! @user, :id, :name, :photo, :wechat_id, :description, :latitude, :longitude

json.bookings do
  json.array! @user.bookings do |booking|
    json.extract! booking, :id, :event_id, :attendance, :review
    json.extract! booking.event, :activity_type, :capacity, :spots_filled, :description, :location, :latitude, :longitude, :photo
    json.date booking.event.start_time.strftime("%b %d, %Y")
    json.start_time booking.event.start_time.strftime("%H:%M")
    json.end_time booking.event.end_time.strftime("%H:%M")
    json.extract! booking.event.user, :name
  end
end

json.events do
  json.array! @user.events do |event|
    json.extract! event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :location, :latitude, :longitude, :photo
    json.date event.start_time.strftime("%b %d, %Y")
    json.start_time event.start_time.strftime("%H:%M")
    json.end_time event.end_time.strftime("%H:%M")
  end
end

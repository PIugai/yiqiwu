json.extract! @user, :id, :name, :photo, :wechat_id, :description, :latitude, :longitude

json.bookings do
  json.array! @user.bookings do |booking|
    json.extract! booking, :event_id, :attendance, :review
    json.extract! booking.event, :activity_type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo
    json.extract! booking.event.user, :name
  end
end

json.events do
  json.array! @user.events do |event|
    json.extract! event, :user_id, :activity_type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo
  end
end

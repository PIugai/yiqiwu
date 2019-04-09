json.extract! @event, :id, :user_id, :type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo
json.events @user.events do |event|
  json.extract! event, :id, :user_id, :type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo
  json.reviews event.bookings do |booking|
    json.extract! booking, :review
  end
end

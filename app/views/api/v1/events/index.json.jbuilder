json.events do
  json.array! @events do |event|
    json.extract! event, :id, :user_id, :type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo
  end
end

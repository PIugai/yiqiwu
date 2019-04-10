json.events do
  json.array! @events do |event|
    json.extract! event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo, :iconPath
  end
end

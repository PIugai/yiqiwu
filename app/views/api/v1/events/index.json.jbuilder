json.events do
  json.array! @events do |event|
    json.extract! event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :location, :latitude, :longitude, :photo, :iconPath
    json.date event.start_time.strftime("%b %d, %Y")
    json.start_time event.start_time.strftime("%H:%M")
    json.end_time event.end_time.strftime("%H:%M")
  end
end

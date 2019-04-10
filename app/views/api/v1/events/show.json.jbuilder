json.extract! @event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo
json.other_events do
  json.array! @event.user.events do |event|
    json.extract! event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo if event.id != @event.id
  end
end

json.extract! @event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :location, :latitude, :longitude, :photo
json.date @event.start_time.strftime("%b %d, %Y")
json.start_time @event.start_time.strftime("%H:%M")
json.end_time @event.end_time.strftime("%H:%M")
json.host @event.user.name
json.host_photo @event.user.photo
json.other_events do
  json.array! @event.user.events do |event|
    json.extract! event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :start_time, :end_time, :location, :latitude, :longitude, :photo if event.id != @event.id
  end
end

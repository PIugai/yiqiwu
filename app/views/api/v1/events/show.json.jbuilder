json.extract! @event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :location, :latitude, :longitude, :photo, :iconPathYellow, :iconPathRed
json.date @event.start_time.strftime("%b %d, %Y")
json.start_time @event.start_time.strftime("%H:%M")
json.end_time @event.end_time.strftime("%H:%M")
json.host_name @event.user.name
json.host_photo @event.user.photo
json.host_other_events do
  json.array! @event.user.events do |event|
    if event.id != @event.id
      json.extract! event, :id, :user_id, :activity_type, :capacity, :spots_filled, :description, :location, :latitude, :longitude, :photo, :iconPath, :iconPathSelect
      json.date @event.start_time.strftime("%b %d, %Y")
      json.start_time @event.start_time.strftime("%H:%M")
      json.end_time @event.end_time.strftime("%H:%M")
    end
  end
end

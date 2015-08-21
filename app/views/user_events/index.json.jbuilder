json.array!(@user_events) do |user_event|
  json.extract! user_event, :id, :user_id, :event_id, :created_dt
  json.url user_event_url(user_event, format: :json)
end

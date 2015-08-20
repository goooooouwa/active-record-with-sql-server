json.array!(@events) do |event|
  json.extract! event, :id, :lnk_evnt_id, :lnk_evnt_status_id, :org_id, :created_dt, :modified_dt, :created_by_user_id, :modified_by_user_id
  json.url event_url(event, format: :json)
end

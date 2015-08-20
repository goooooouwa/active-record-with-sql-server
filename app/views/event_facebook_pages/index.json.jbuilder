json.array!(@event_facebook_pages) do |event_facebook_page|
  json.extract! event_facebook_page, :id, :evnt_id, :facebook_page_id, :created_dt
  json.url event_facebook_page_url(event_facebook_page, format: :json)
end

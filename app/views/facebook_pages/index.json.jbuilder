json.array!(@facebook_pages) do |facebook_page|
  json.extract! facebook_page, :id, :facebook_page_id, :access_token, :created_dt
  json.url facebook_page_url(facebook_page, format: :json)
end

json.array!(@users) do |user|
  json.extract! user, :id, :aus_id, :refresh_token, :created_dt, :modified_dt, :admin, :ent_prsn_id
  json.url user_url(user, format: :json)
end

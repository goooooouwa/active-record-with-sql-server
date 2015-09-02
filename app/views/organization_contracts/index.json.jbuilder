json.array!(@organization_contracts) do |organization_contract|
  json.extract! organization_contract, :id, :organization_id, :contract_id, :signed_by_user_id, :signed_dt, :created_dt, :modified_dt
  json.url organization_contract_url(organization_contract, format: :json)
end

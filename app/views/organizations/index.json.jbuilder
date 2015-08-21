json.array!(@organizations) do |organization|
  json.extract! organization, :id, :org_src_id, :org_id, :account_type_id, :created_dt, :modified_dt, :created_by_user_id, :modified_by_user_id, :target_marketer_bit, :target_marketer_subscription_pricing_id, :target_marketer_billing_user_id
  json.url organization_url(organization, format: :json)
end

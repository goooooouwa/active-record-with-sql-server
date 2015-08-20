class FacebookPage < ActiveRecord::Base
  self.table_name = 'FacebookPages'
  self.primary_key = 'id'

  belongs_to :event

  alias_attribute :page_id, :facebook_page_id
  alias_attribute :token, :access_token
  alias_attribute :created_at, :created_dt
end

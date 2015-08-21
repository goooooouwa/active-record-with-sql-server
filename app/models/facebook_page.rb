class FacebookPage < ActiveRecord::Base
  self.table_name = 'FacebookPages'

  has_and_belongs_to_many :events, join_table: "EventFacebookPages"

  alias_attribute :page_id, :facebook_page_id
  alias_attribute :token, :access_token
  alias_attribute :created_at, :created_dt
end

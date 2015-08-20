class FacebookPage < ActiveRecord::Base
  self.table_name = 'FacebookPages'
  self.primary_key = 'id'

  has_and_belongs_to_many :events, join_table: "EventFacbookPages"
  # has_many :event_facebook_pages
  # has_many :events, through: :event_facebook_pages

  alias_attribute :page_id, :facebook_page_id
  alias_attribute :token, :access_token
  alias_attribute :created_at, :created_dt
end

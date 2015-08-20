class Event < ActiveRecord::Base
  self.table_name = 'Events'
  self.primary_key = 'id'

  has_and_belongs_to_many :facebook_pages, join_table: "EventFacebookPages", foreign_key: :evnt_id
end

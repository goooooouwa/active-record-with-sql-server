class Event < ActiveRecord::Base
  self.table_name = 'Events'
  self.primary_key = 'id'

  has_and_belongs_to_many :facebook_pages, join_table: "EventFacbookPages"
  #has_many :event_facebook_pages
  #has_many :facebook_pages, through: :event_facebook_pages
end

class Event < ActiveRecord::Base
  self.table_name = 'Events'
  self.primary_key = 'id'

  has_many :facebook_pages
end

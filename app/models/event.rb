class Event < ActiveRecord::Base
  has_and_belongs_to_many :facebook_pages, join_table: "EventFacebookPages", foreign_key: :evnt_id
  belongs_to :user
end

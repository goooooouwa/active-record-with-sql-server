class Event < ActiveRecord::Base
  has_and_belongs_to_many :facebook_pages, join_table: "EventFacebookPages", foreign_key: :evnt_id
  has_one :user_event
  delegate :user, :to => :user_event, :allow_nil => true
end

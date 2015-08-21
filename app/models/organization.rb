class Organization < ActiveRecord::Base
  has_many :events, foreign_key: :org_id
end

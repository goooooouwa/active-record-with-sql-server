class UserEvent < ActiveRecord::Base
  self.table_name = 'UserEvents'

  belongs_to :user
  belongs_to :event
end

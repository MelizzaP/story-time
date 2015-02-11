class UserTale < ActiveRecord::Base
  belongs_to :user
  belongs_to :tale
end

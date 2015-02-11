class Tale < ActiveRecord::Base
  has_many :user_tales
  has_many :users, :through => :user_tales
end

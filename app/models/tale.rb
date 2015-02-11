class Tale < ActiveRecord::Base
  has_many :users, :through => :user_tales
end

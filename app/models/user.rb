class User < ActiveRecord::Base
  has_many :user_tales
  has_many :tales, :through => :user_tales
end

class Tale < ActiveRecord::Base
  has_many :user_tales
  has_many :users, :through => :user_tales

  def self.find_by_id(id)
    Tale.find(id)
  end

end

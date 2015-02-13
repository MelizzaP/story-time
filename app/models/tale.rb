class Tale < ActiveRecord::Base
  has_many :user_tales
  has_many :users, :through => :user_tales

  def self.find_by_id(id)
    Tale.find(id)
  end
  
  def self.update_content(params)
    tale = find_by_id(params[:id])
    content = (tale.content || '') + params[:text] 
    tale.update(:content => content)
  end

end

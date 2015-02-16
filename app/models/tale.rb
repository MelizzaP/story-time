class Tale < ActiveRecord::Base
  has_many :user_tales
  has_many :users, :through => :user_tales

  def self.find_by_id(id)
    Tale.find(id)
  end
  
  def self.update_content(params)
    tale = find_by_id(params[:id])
    users = UserTale.where(:tale_id => params[:id]).map { |user_tale| user_tale.user_id}
    
    # only allows one word to be added                     
    word_requirements = tale.story_type == 'word' &&  
      params[:text].split(' ').length == 1
    
    # only allows one sentence to be added
    sentence_requirements = tale.story_type == 'sentence' && 
      params[:text].split('/[?.!]/').length == 1 &&    
      params[:text].length < 141  #  sentence must be 140 characters or less
    
    # finds if the tale is public and if the user has persmission to edit it
    access = tale.public_access || !tale.public_access && users.include?(params[:user_id])
    
    if(word_requirements && access || sentence_requirements && access) 
      content = (tale.content || '') + params[:text] 
      tale.update(:content => content)
    end
  end
  
   
end

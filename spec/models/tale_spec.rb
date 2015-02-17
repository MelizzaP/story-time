require 'rails_helper'

RSpec.describe Tale, type: :model do
  
  before(:each) do
    @tale = FactoryGirl.create(:tale)
    @user = FactoryGirl.create(:user)
  end
  
  it 'generates a list of titles'
  it 'generates a list of inspiration'
  
  it "gets a tale by id" do 
    db_tale = Tale.find_by_id(@tale.id)
    expect(db_tale.id).to eq(@tale.id)
  end
  
  it 'updates the content of a tale' do
    Tale.update_content({:id => @tale.id, :text => 'Once', :user_id => @user.id})
    db_tale = Tale.find_by_id(@tale.id)
    expect(db_tale.content).to eq('Once ')
  end
  
  context 'when story_type is word' do
    it 'allows one word to be inserted' do
      Tale.update_content({:id => @tale.id, :text => 'Finally', :user_id => @user.id})
      db_tale = Tale.find_by_id(@tale.id)
      expect(db_tale.content).to eq('Finally ')
    end
    
    it 'does not allow multiple words' do
      Tale.update_content({:id => @tale.id, :text => 'Finally stuff', :user_id => @user.id})
      db_tale = Tale.find_by_id(@tale.id)
      expect(db_tale.content).to be_nil
    end
    
    it 'user cannot add 2 consecutive words' do
      Tale.update_content({:id => @tale.id, :text => 'Finally', :user_id => @user.id})
      Tale.update_content({:id => @tale.id, :text => 'I', :user_id => @user.id})
      db_tale = Tale.find_by_id(@tale.id)
      expect(db_tale.content).to eq('Finally ')
    end
    
  end
  
  context 'when story_type is sentence' do
    before(:each) do 
      @sentence_tale = FactoryGirl.create(:sentence_tale)
    end
    
    it 'allows one sentence to be inserted' do
      Tale.update_content({:id => @sentence_tale.id, :text => 'Finally, I have a cool backpack!', :user_id => @user.id})
      db_tale = Tale.find_by_id(@sentence_tale.id)
      expect(db_tale.content).to eq('Finally, I have a cool backpack! ')
    end
    
    it 'ensures sentence is less than 140 characters' do
      Tale.update_content(
        {
          :id => @sentence_tale.id,
          :text => 'this string is 141  characters long ablakjdflkajdadfffffffffffffffffffffffffdddd dddddddddddddddddddddddddddddddddddddddddddddddddddddddddadd',
          :user_id => @user.id
        }
      )
      db_tale = Tale.find_by_id(@sentence_tale.id)
      expect(db_tale.content).to be_nil
    end
    
    it 'user cannot add 2 consecutive sentences' do
      Tale.update_content({:id => @sentence_tale.id, :text => 'Cats are cool.', :user_id => @user.id})
      Tale.update_content({:id => @sentence_tale.id, :text => 'So say we all.', :user_id => @user.id})
      db_tale = Tale.find_by_id(@sentence_tale.id)
      expect(db_tale.content).to eq('Cats are cool. ')
    end
  end
  
  context 'public_access=true' do
    it 'allows any user to update tale' do
      Tale.update_content({:id => @tale.id, :text => 'Once', :user_id => @user.id})
      db_tale = Tale.find_by_id(@tale.id)
      expect(db_tale.content).to eq('Once ')
    end
  end
  
  context 'public_access=false' do
    it 'allows users assigned to update tale' do
      user_tale = FactoryGirl.create(:user_tale)
      Tale.update_content(
        {
          :id => user_tale.tale_id, 
          :text => 'Once', 
          :user_id => user_tale.user_id
        })
      db_tale = Tale.find_by_id(user_tale.tale_id)
      expect(db_tale.content).to eq('Once ')
  end
  
    it 'does not update db when users not assigned to tale' do
      user_tale = FactoryGirl.create(:user_tale)
      user = FactoryGirl.create(:user)
      tale = Tale.find(user_tale.tale_id)
      Tale.update_content({:id => tale.id, :text => 'Once', :user_id => user.id})
      db_tale = Tale.find_by_id(tale.id)
      expect(db_tale.content).to be_nil
    end
    
  end  
end

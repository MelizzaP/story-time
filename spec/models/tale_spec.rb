require 'rails_helper'

RSpec.describe Tale, type: :model do
  
  it 'generates a list of titles'
  it 'generates a list of inspiration'
  
  it "gets a tale by id" do 
    tale = FactoryGirl.create(:tale)
    response = Tale.find_by_id(tale.id)
    expect(response.id).to eq(tale.id)
  end
  
  it 'updates the content of a tale' do
    tale = FactoryGirl.create(:tale)
    Tale.update_content({:id => tale.id, :text => 'Once'})
    response = Tale.find_by_id(tale.id)
    expect(response.content).to eq('Once')
  end
  
  context 'when story_type is word' do
    it 'allows one word to be inserted' do
      tale = FactoryGirl.create(:tale)
      Tale.update_content({:id => tale.id, :text => 'Finally'})
      response = Tale.find_by_id(tale.id)
      expect(response.content).to eq('Finally')
    end
    
    it 'does not allow multiple words' do
      tale = FactoryGirl.create(:full_tale)
      Tale.update_content({:id => tale.id, :text => 'Finally stuff'})
      db = Tale.find_by_id(tale.id)
      expect(db.content).to eq('My foot is a')
    end
    
    it 'makes user wait until 2 words have been added'
#   can I do this?
    it 'makes sure that input is a word'
    
  end
  
  context 'when story_type is sentence' do
    it 'allows one sentence to be inserted' do
      tale = FactoryGirl.create(:sentence_tale)
      Tale.update_content({:id => tale.id, :text => 'Finally, I have a cool backpack!'})
      db_tale = Tale.find_by_id(tale.id)
      expect(db_tale.content).to eq('Finally, I have a cool backpack!')
    end
    
    it 'ensures sentence is less than 140 characters' do
      tale = FactoryGirl.create(:sentence_tale)
      Tale.update_content(
        {
          :id => tale.id,
          :text => 'this string is 141  characters long ablakjdflkajdadfffffffffffffffffffffffffdddd dddddddddddddddddddddddddddddddddddddddddddddddddddddddddadd'
        }
      )
      db_tale = Tale.find_by_id(tale.id)
      expect(db_tale.content).to be_nil
    end
    
    it 'makes a user wait until two sentences have been added'
  end
  
  context 'public_access=true' do
    it 'allows any user to update tale'
  end
  
  context 'public_access=false' do
    it 'allows only users assigned to update tale'
  end  
end

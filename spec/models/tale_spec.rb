require 'rails_helper'

RSpec.describe Tale, type: :model do
  
  it 'generates a list of titles'
  it 'generates a list of inspiration'
  it "gets a tale by id"
  it 'updates the content of a tale'
  
  context 'when story_type is word' do
    it 'only allows one word to be inserted'
    it 'makes user wait until 2 words have been added'
    it 'makes sure that input is a word'
  end
  
  context 'when story_type is sentence' do
    it 'only allows one sentence to be inserted'
    it 'ensures sentence is less than 140 characters'
    it 'saves updated content to the data base'
    it 'makes a user wait until two sentences have been added'
  end
  
  content 'public_access=true' do
    it 'allows any user to update tale'
  end
  
  content 'public_access=false'
    it 'allows only users assigned to update tale'
  end  
end

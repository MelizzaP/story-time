FactoryGirl.define do
  factory :tale do
    story_type 'word'
    public_access true
    
    factory :sentence_tale do 
      story_type 'sentence'
    end
    
    factory :private_tale do
      public_access false
    end
    
    factory :full_tale do
      title 'The foot'
      content 'My foot is a'
      inspiration 'A foot'
    end
  
  end
end
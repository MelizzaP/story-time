FactoryGirl.define do
  factory :user_tale do
    user
    association :tale,factory: :tale, public_access: false
    
  end
end
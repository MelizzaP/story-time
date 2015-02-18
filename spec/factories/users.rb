FactoryGirl.define do
  factory :user do
    sequence(:email, 1000) { |n| "person#{n}@example.com" }
    password 'password'
    password_confirmation "password"
    sequence(:name, 1000) { |n| "Melissa#{n}" }
  end
end
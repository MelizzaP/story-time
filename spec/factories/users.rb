FactoryGirl.define do
  factory :user do
    sequence(:email, 1000) { |n| "person#{n}@example.com" }
    password 'password'
    password_confirmation "password"
  end
end
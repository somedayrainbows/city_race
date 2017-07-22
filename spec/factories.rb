FactoryGirl.define do
  factory :user do
    first_name "my first name"
    last_name "my last name"
    sequence(:email) { |n| Faker::Internet.email("sample#{n}") }
    password "some_password"
    password_confirmation "some_password"
    role 1
  end
end

FactoryGirl.define do
  factory :clue do
    title "MyString"
    description "MyString"
    order 1
    task_type "MyString"
    hunt nil
  end
  factory :user_team do
    user nil
    team nil
  end
  factory :team do
    name "MyString"
    access_code 1
    hunt nil
  end
  factory :hunt do
    name "MyString"
    description "MyString"
    status "MyString"
    user nil
  end
  factory :user do
    first_name "my first name"
    last_name "my last name"
    sequence(:email) { |n| Faker::Internet.email("sample#{n}") }
    password "some_password"
    password_confirmation "some_password"
    role 1
  end
end

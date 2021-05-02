FactoryBot.define do
  factory :user do
    name { 'test_user' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { 'test1234567890' }
    password_confirmation { 'test1234567890' }
    user_type { 'student' }
  end
end

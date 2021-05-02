FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'test1234567890' }
    password_confirmation { 'test1234567890' }
    user_type { 'student' }
  end
end

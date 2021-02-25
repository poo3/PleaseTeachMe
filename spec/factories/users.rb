FactoryBot.define do
  factory :user do
    name { "test_user" }
    email { "example@test.co.jp" }
    password {"test1234567890"}
    password_confirmation {"test1234567890"}
    user_type { "student" }
  end
end

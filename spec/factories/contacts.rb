FactoryBot.define do
  factory :contact do
    name { "test_user" }
    email { "example@test.co.jp" }
    content { "MyText test_contact 困っています〜" }
  end
end

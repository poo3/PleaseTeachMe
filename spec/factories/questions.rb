FactoryBot.define do
  factory :question do
    title { "TestTitle"}
    content { "TeseText" }
    subject { "TestString" }
    user { nil }
  end
end

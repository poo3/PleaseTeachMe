FactoryBot.define do
  factory :question do
    content { "TeseText" }
    subject { "TestString" }
    user { nil }
  end
end

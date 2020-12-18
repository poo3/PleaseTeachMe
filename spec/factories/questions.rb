FactoryBot.define do
  factory :question do
    content { "MyText" }
    subject { "MyString" }
    user { nil }
  end
end

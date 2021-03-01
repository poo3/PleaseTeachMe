# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メインサンプルユーザ(生徒)
User.create!(
  email: 'example-student@example.com',
  name: 'テストユーザ',
  password: 'password',
  password_confirmation: 'password',
  user_type: 'student'
)
# メインサンプルユーザ(教師)
User.create!(
  email: 'example-teacher@example.com',
  name: 'テストユーザ',
  password: 'password',
  password_confirmation: 'password',
  user_type: 'teacher'
)

# 追加のユーザーをまとめて生成する(生徒)
99.times do |n|
  name  = Faker::Name.name
  email = "example-student-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               user_type: 'student')
end

# 追加のユーザーをまとめて生成する(教師)
99.times do |n|
  name  = Faker::Name.name
  email = "example-teacher-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               user_type: 'teacher')
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.questions.create!(
    content: content,
    title: 'テスト投稿された質問') 
  }
end
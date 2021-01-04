require 'rails_helper'

RSpec.describe "UsersProfiles", type: :system do
  
  before do
    @user = FactoryBot.create(:user)
    50.times do
      content = Faker::Lorem.sentence(word_count: 5)
      @user.questions.create!(title: "TestTitle",content: content)
    end
  end

  scenario 'ユーザプロフィール画面へアクセス' do
    # ユーザログインする
    visit login_path
    expect(page).to have_content 'Log in'
    fill_in 'session_email', with: @user.email
    fill_in 'session_password', with: @user.password
    click_button 'ログイン'
    # ユーザ詳細画面のテストここから記述
    expect(page).to have_selector 'div.user-controller'
    expect(page).to have_selector 'div.questions-wrapper'
    expect(page).to have_content @user.name
    expect(page).to have_content @user.questions.count.to_s
    expect(page).to have_selector 'div.pagination'
    @user.questions.paginate(page: 1).each do |question|
      # ページタイトルが表示されているか確認する
      expect(page).to have_content question.title
    end
  end


end

require 'rails_helper'

RSpec.describe "QuestionsDeletes", type: :system do
  before do
    #ユーザを作成する
    @test_user = FactoryBot.create(:user)
    #質問を複数個作成する
    @test_questions = FactoryBot.create_list(:question,10,user: @test_user)
    #テストユーザでログインする
    visit login_path
    fill_in 'session_email', with: @test_user.email
    fill_in 'session_password', with: @test_user.password
    click_button 'ログイン'
  end

  scenario "ユーザ一覧画面から質問を削除する" do
    visit user_path(@test_user)
    expect(page).to have_content @test_user.name
    expect(@test_user.questions.count).to eq 10
    # 質問削除ボタンをクリック
    page.accept_confirm do
      first(".delete-question-link").click
    end
    # 質問の数が変わっているか確認する
    expect(page).to have_content "9"
  end

  scenario "質問詳細画面から質問を削除する" do
    visit user_path(@test_user)
    expect(page).to have_content @test_user.name
    expect(@test_user.questions.count).to eq 10
    first(".question-title").click
    expect(page).to have_content "質問内容確認"
    # 質問削除ボタンをクリック
    page.accept_confirm do
      click_link("質問を削除")
    end
    # 質問の数が変わっているか確認する
    expect(page).to have_content @test_user.name
    expect(page).to have_content "9"
  end

end

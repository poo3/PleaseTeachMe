require 'rails_helper'

RSpec.describe "QuestionsPosts", type: :system do
  before do
    #ユーザを作成する
    @test_user = FactoryBot.create(:user)
    #質問のを作成する
    @test_question = FactoryBot.create(:question,user: @test_user)
    # 質問の個数を記録する変数
    @count_question = Question.count
    #テストユーザでログインする
    visit login_path
    fill_in 'session_email', with: @test_user.email
    fill_in 'session_password', with: @test_user.password
    click_button 'ログイン'
  end

  scenario "正しい形式でマイページから質問を投稿する" do
    # ユーザ詳細画面
    visit user_path(@test_user)
    expect(page).to have_content @test_user.name
    click_link '質問を投稿'
    # 質問投稿画面
    expect(page).to have_content '質問投稿'
    fill_in 'question_title', with: @test_question.title
    fill_in 'question_content', with: @test_question.content
    click_button '投稿'
    expect(page).to have_content @test_user.name
    expect(Question.count).to eq @count_question+1
    expect(page).to have_content @test_question.title
  end
  
  scenario "titleが入力されていない状態で質問を投稿する" do
    # ユーザ詳細画面
    visit user_path(@test_user)
    expect(page).to have_selector 'div.questions-wrapper'
    click_link '質問を投稿'
    # 質問投稿画面
    expect(page).to have_content '質問投稿'
    fill_in 'question_title', with: 'a'*100
    fill_in 'question_content', with: @test_question.content
    click_button '投稿'
    expect(page).to have_content '質問投稿'
  end

end

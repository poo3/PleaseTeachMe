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
    sign_in_as @test_user
  end

  scenario "正しい形式でマイページから質問を投稿する" do
    # ユーザ詳細画面
    visit user_path(@test_user)
    expect(page).to have_content @test_user.name
    click_link '質問を投稿'
    # 質問投稿画面
    expect(page).to have_content '質問投稿'
    post_question(@test_question)
    expect(page).to have_content @test_user.name
    expect(Question.count).to eq @count_question+1
    expect(page).to have_content @test_question.title
  end
  
  scenario "titleの文字制限を超えた状態で質問を投稿する" do
    @test_question.title = 'a'*100
    # ユーザ詳細画面
    visit user_path(@test_user)
    expect(page).to have_selector 'div.questions-wrapper'
    click_link '質問を投稿'
    # 質問投稿画面
    expect(page).to have_content '質問投稿'
    post_question(@test_question)
    expect(page).to have_content '質問投稿'
  end

end

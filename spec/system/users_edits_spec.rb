require 'rails_helper'

RSpec.describe "UsersEdits", type: :system do
  feature "ユーザ編集機能" do
    
    before do
      #ユーザを作成する
      @test_user = FactoryBot.create(:user)
      #テストユーザでログインする
      visit login_path
      fill_in 'session_email', with: @test_user.email
      fill_in 'session_password', with: @test_user.password
      click_button 'ログイン'
    end
  
    scenario "名前がない状態で編集登録する" do
      visit edit_user_path(@test_user)
      fill_in 'user_name', with: ''
      fill_in 'user_password', with: @test_user.password
      fill_in 'user_password_confirmation', with: @test_user.password_confirmation
      click_button '編集完了'
      expect(page).to have_selector 'div.alert-danger'
    end
  
    scenario "メールアドレスがない状態で編集登録する" do
      visit edit_user_path(@test_user)
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: @test_user.password
      fill_in 'user_password_confirmation', with: @test_user.password_confirmation
      click_button '編集完了'
      expect(page).to have_selector 'div.alert-danger'
    end
  
    scenario "パスワードが誤った状態で編集登録する" do
      visit edit_user_path(@test_user)
      fill_in 'user_password', with: @test_user.password
      fill_in 'user_password_confirmation', with: 'aiueotester'
      click_button '編集完了'
      expect(page).to have_selector 'div.alert-danger'
    end
  
    # scenario "パスワードが空の状態で編集登録する" do
    #   visit edit_user_path(@test_user)
    #   click_button '編集完了'
    #   expect(page).to have_selector 'div.alert-danger'
    # end
    scenario "正しい情報で編集登録する" do
      visit edit_user_path(@test_user)
      fill_in 'user_name', with: 'valid_name'
      fill_in 'user_email', with: 'valid@example.com'
      fill_in 'user_password', with: 'validpassword'
      fill_in 'user_password_confirmation', with: 'validpassword'
      click_button '編集完了'
      expect(page).to have_content "プロフィール更新しました！"
    end
  end


  feature "ユーザコントローラーedit,updateのアクション保護機能" do
    before do
      #ユーザを作成する
      @test_user = FactoryBot.create(:user)
    end
    scenario "セッションが切れている状態で編集ページアクセス" do
      visit edit_user_path(@test_user)
      expect(page).to have_content 'ログインしてください'
      expect(page).to have_content 'Log in'
    end
  end

  feature "自身以外のユーザ情報を編集できないようにする機能" do
    before do
      #ユーザを作成する
      @test_user = FactoryBot.create(:user)
      #その他のユーザ
      @other_user = FactoryBot.create(:user,name: "other_test_user",email: "example@other.co.jp")
      #自身のログイン
      visit login_path
      fill_in 'session_email', with: @test_user.email
      fill_in 'session_password', with: @test_user.password
      click_button 'ログイン'
    end

    scenario "違うユーザの編集ページへアクセス" do
      visit edit_user_path(@other_user)
      expect(page).to have_selector 'div.introduction-app-container'
      expect(page).to_not have_selector 'div.alert'
    end
  end

  feature "フレンドリーフォワーディング" do
    before do
      #ユーザを作成する
      @test_user = FactoryBot.create(:user)
    end
    
    scenario "ログインする前に編集ページにアクセス" do
      visit edit_user_path(@test_user)
      fill_in 'session_email', with: @test_user.email
      fill_in 'session_password', with: @test_user.password
      click_button 'ログイン'
      expect(page).to have_content 'Edit User'
      expect(page).to_not have_selector 'div.introduction-app-container'
    end
  end
end

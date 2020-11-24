require 'rails_helper'

RSpec.describe "UsersLogins", type: :system do
  context '無効な情報でログインする時' do
    scenario 'ログインする' do
      visit login_path
      expect(page).to have_content 'Log in'
      fill_in 'session_email', with: ''
      fill_in 'session_password', with: ''
      click_button 'ログイン'
      #ログイン後エラーメッセージが表示されているか確認する
      expect(page).to have_content 'Log in'
      expect(page).to have_selector 'div.alert-danger'
      visit root_path
      expect(page).to_not have_selector 'div.alert'
    end
  end

  context "有効な情報でユーザログインする時" do
    before do
      #ユーザを作成する
      @test_user = FactoryBot.create(:user)
    end
    scenario "ログインする" do
      visit login_path
      expect(page).to have_content 'Log in'
      fill_in 'session_email', with: @test_user.email
      fill_in 'session_password', with: @test_user.password
      click_button 'ログイン'
      #ログイン後ユーザ詳細画面へリダイレクトしているか確認
      expect(page).to have_content 'ログアウト'
      expect(page).to have_content 'ログインに成功しました！'
    end
  end

  context "ユーザがログインしている時" do 
    before do
      #ユーザを作成する
      test_user = FactoryBot.create(:user)
      #ログインする
      visit login_path
      expect(page).to have_content 'Log in'
      fill_in 'session_email', with: test_user.email
      fill_in 'session_password', with: test_user.password
      click_button 'ログイン'
    end

    scenario "ログアウトする" do
      visit root_path
      click_link 'ログアウト'
      #ログアウト後にホーム画面に戻っているかチェック
      expect(page).to have_content 'ログイン'
      expect(page).to have_selector 'div.introduction-app-container'
    end
  end
end


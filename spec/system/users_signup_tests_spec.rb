require 'rails_helper'

RSpec.describe "UsersSignupTests", type: :system do
  context "無効な情報でユーザ登録する時" do
    scenario "無効な情報で新規登録をする" do
      visit new_user_path
      fill_in 'user_name', with: ' '
      fill_in 'user_email', with: 'user@invalid'
      fill_in 'user_password', with: 'foo'
      fill_in 'user_password_confirmation', with: 'bar'
      click_button '新規登録'
      #エラーメッセージが描画されている事を検証する
      expect(page).to have_selector 'div.field_with_errors'
      expect(page).to have_button '新規登録'
      expect(page).to have_selector 'div#error_explanation'
    end
  end

  context "有効な情報を入力し新規登録を実施する" do
    scenario "有効な情報で新規登録をする" do
      visit new_user_path
      fill_in 'user_name', with: 'poo3'
      fill_in 'user_email', with: 'example@example.com'
      fill_in 'user_password', with: 'test1234test1234'
      fill_in 'user_password_confirmation', with: 'test1234test1234'
      click_button '新規登録'
      #作成したユーザの詳細ページにリダイレクトしているか確認
      expect(current_path).to eq user_path(User.first.id)
      expect(page).to have_selector 'div.alert-success'
    end
  end

end

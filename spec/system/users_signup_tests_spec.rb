require 'rails_helper'

RSpec.describe "UsersSignupTests", type: :system do
  context "無効な情報でユーザ登録する時" do
    scenario "無効な情報で新規登録をする" do
      visit new_user_path
      fill_in 'user_name', with: ' '
      fill_in 'user_email', with: 'user@invalid'
      fill_in 'user_password', with: 'foo'
      fill_in 'user_password_confirmation', with: 'bar'
      click_button '新規登録をする！'
      #エラーメッセージが描画されている事を検証する
      expect(page).to have_selector 'div.field_with_errors'
      expect(page).to have_button '新規登録をする！'
      expect(page).to have_selector 'div#error_explanation'
    end
  end

end

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
end


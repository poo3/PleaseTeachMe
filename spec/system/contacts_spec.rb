require 'rails_helper'

RSpec.describe "Contacts", type: :system do
  before do
    #お問い合わせを作成する
    @test_contact = FactoryBot.create(:contact)
  end

  feature "お問い合わせ送信機能" do
    scenario "nameの値が無効な時" do
      visit new_contact_path
      fill_in 'contact_name' , with: '  '
      fill_in 'contact_email', with: @test_contact.email
      fill_in 'contact_content', with: @test_contact.content
      click_button '送信'
      expect(page).to have_selector 'div.alert-danger'
    end

    scenario "emailの値が無効な時" do
      visit new_contact_path
      fill_in 'contact_name' , with: @test_contact.name
      fill_in 'contact_email', with: '  '
      fill_in 'contact_content', with: @test_contact.content
      click_button '送信'
      expect(page).to have_selector 'div.alert-danger'
    end

    scenario "contentの値が無効な時" do
      visit new_contact_path
      fill_in 'contact_name' , with: @test_contact.name
      fill_in 'contact_email', with: @test_contact.email
      fill_in 'contact_content', with: '  '
      click_button '送信'
      expect(page).to have_selector 'div.alert-danger'
    end
    
  end

end

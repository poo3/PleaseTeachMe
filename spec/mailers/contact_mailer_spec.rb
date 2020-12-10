require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe "contact_mail" do
    let(:contact){FactoryBot.create(:contact)}
    let(:mail){ContactMailer.contact_mail(contact)}
    #ユーザからのお問い合わせ内容が設定したメールアドレスに届く
    it "sends contact email to the setting email" do
      expect(mail.to).to eq(["applicationtestpoo3@gmail.com"])
    end

    #ユーザからのお問い合わせに必要な情報が入力されているか
    it "sends must information in email text" do
      expect(contact.name).to_not eq(nil)
      expect(contact.email).to_not eq(nil)
      expect(contact.content).to_not eq(nil)
    end
  end
end

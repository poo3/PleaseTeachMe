require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe "contact_mail" do
    let(:contact){FactoryBot.create(:contact)}
    let(:mail){ContactMailer.contact_mail(contact)}
    #ユーザからのお問い合わせ内容が設定したメールアドレスに届く
    it "sends contact email to the setting email" do
      expect(mail.to).to eq(["applicationtestpoo3@gmail.com"])
    end
  end
end

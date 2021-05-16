require 'rails_helper'

RSpec.describe ContactMailer, type: :mailer do
  describe 'contact_mail' do
    let(:contact) { FactoryBot.create(:contact) }
    let(:contact_mail) { ContactMailer.contact_mail(contact) }
    let(:thanks_for_contacting_mail) do
      ContactMailer.thanks_for_contacting(contact)
    end

    #ユーザからのお問い合わせに必要な情報が入力されているか
    it 'sends must information in email text' do
      expect(contact.name).to_not eq(nil)
      expect(contact.email).to_not eq(nil)
      expect(contact.content).to_not eq(nil)
    end

    # contact_mail
    #ユーザからのお問い合わせ内容が設定したメールアドレスに届く
    it 'sends contact email to the setting email' do
      expect(contact_mail.to).to eq(['applicationtestpoo3@gmail.com'])
    end

    it '正しい件名で送信できていること' do
      expect(contact_mail.subject).to eq(
        '【PleaseTeachMe】ユーザからのお問い合わせ',
      )
    end
    it 'メール本文に名前があること' do
      expect(contact_mail.html_part.body.to_s).to match contact.name
    end

    it 'メール本文に質問内容が含まれていること' do
      expect(contact_mail.html_part.body.to_s).to match contact.content
    end

    it 'メール本文に質問者のメールアドレスが含まれていること' do
      expect(contact_mail.html_part.body.to_s).to match contact.email
    end

    # thanks_for_contacting_mail
    it 'ユーザが指定したメールアドレスに受付完了メールが届く' do
      expect([contact.email]).to eq(thanks_for_contacting_mail.to)
    end

    it '正しい件名で送信できていること' do
      expect(thanks_for_contacting_mail.subject).to eq(
        '【PleaseTeachMe】お問い合わせありがとうございます',
      )
    end

    it 'ユーザにお礼の一言をすること' do
      expect(thanks_for_contacting_mail.html_part.body.to_s).to match(
        "#{contact.name}様お問い合わせありがとうございます！",
      )
    end

    it '質問の内容がサンクスメールに含まれていること' do
      expect(thanks_for_contacting_mail.html_part.body.to_s).to match contact
              .content
    end
  end
end

class ContactMailer < ApplicationMailer
  default from: 'pleaseteachme@example.com'

  #アプリケーション運営側へお問い合わせ内容を送る
  def contact_mail(contact)
    @contact = contact
    mail to:"applicationtestpoo3@gmail.com",subject: "【PleaseTeachMe】ユーザからのお問い合わせ"
  end

  # お問い合わせ送信者にThanksメールを送る
  def thanks_for_contacting(contact)
    @contact = contact
    mail to:@contact.email,subject: "【PleaseTeachMe】お問い合わせありがとうございます"
  end
end

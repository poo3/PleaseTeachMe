class ContactMailer < ApplicationMailer
  default from: 'pleaseteachme@example.com'

  def contact_mail(contact)
    @contact = contact
    mail to:"applicationtestpoo3@gmail.com",subject: "【PleaseTeachMe】ユーザからのお問い合わせ"
  end

  def thanks_for_contacting(contact)
    @contact = contact
    mail to:contact.email,subject: "【PleaseTeachMe】お問い合わせありがとうございます"
  end
end

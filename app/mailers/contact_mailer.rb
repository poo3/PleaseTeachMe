class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def contact_mail(contact)
    @contact = contact
    mail to:"applicationtestpoo3@gmail.com",subject: "【PleaseTeachMe】ユーザからのお問い合わせ"
  end
end

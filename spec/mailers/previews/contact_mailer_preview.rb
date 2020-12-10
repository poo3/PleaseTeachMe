# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_mail
    contact = Contact.first
    ContactMailer.contact_mail(contact)
  end
end

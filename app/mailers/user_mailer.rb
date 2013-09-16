# encoding: UTF-8
class UserMailer < ActionMailer::Base
  default from: "support@lamaisoncreole.com"

  def contact_email(msg)
    mail(to: ['info@lamaisoncreole.com', msg.email], bcc:['neoryv@laposte.net', 'mvion@lamaisoncreole.com'], subject: 'Contact Hotel La-Maison-Creole', reply_to: msg.email) do |format|
      format.text do
      	render text: "[#{msg.nom}, #{msg.email}, #{msg.telephone}, #{msg.created_at}]: #{msg.message}"
      end
    end
  end

  def safe_contact_email(msg)
    mail(to: ['info@lamaisoncreole.com'], subject: 'Contact Hotel La-Maison-Creole') do |format|
      format.text do
        render text: "[#{msg.nom}, #{msg.email}, #{msg.telephone}, #{msg.created_at}]: #{msg.message}"
      end
    end
  end

end

class FeedbackMailer < ApplicationMailer
  include ActionView::Helpers

  def admin_email(feedback)
    body = feedback.text
    email_address = "#{feedback.name} <#{feedback.email}>"
    mail(to: ENV["ADMIN_MAIL"], from: email_address, subject: "New feedback from #{email_address}") do |format|
      format.text { render plain: body }
      format.html { render html: content_tag(:p, body) }
    end
  end
end

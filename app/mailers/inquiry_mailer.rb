class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    mail to: ENV['SEND_MAIL'], subject: 'お問い合わせ通知'
  end

end
  
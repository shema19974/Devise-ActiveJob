class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  default from: 'from@example.com'
  def sendmail_blog(blog)
    @blog = blog
    mail to: 'hogehoge@gmail.com', subject: '【blogapp】blog send'
  end
end

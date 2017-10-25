class PicMailer < ApplicationMailer
  def pic_mail(pic)
    @pic = pic

    mail to: @pic.user.email, subject: "投稿完了メール"
  end
end

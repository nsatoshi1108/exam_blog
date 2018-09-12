class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
    user_info = User.find(@blog.user_id)
    mail to: user_info.email, subject: "お問い合わせの確認メール"
  end
end

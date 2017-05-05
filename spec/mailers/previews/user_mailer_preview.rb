# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def notify_new_user
    if User.first.nil?
      User.create(name: 'teste123@gmail.com', password: '123456')
    end
      UserMailer.notify_new_user(User.first)
  end
end

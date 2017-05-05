class UserMailer < ApplicationMailer
  def notify_new_user(user)
    @user = user
    mail(to: "henriquepjv@gmail.com", subject: "Novo cadastro de usuário")
  end
end

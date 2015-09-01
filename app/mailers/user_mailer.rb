class UserMailer < ApplicationMailer
  def activation_needed_email(user)
    @user = user
    mail(to: user.email, subject: "Activación de cuenta")
  end

  def activation_success_email(user)
    @user = user
    mail(to: user.email, subject: "Tu cuenta esta activada")
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_reset_password_url(@user.reset_password_token)
    mail(to: user.email, subject: "Tu contraseña ha sido restablecida")
  end

end

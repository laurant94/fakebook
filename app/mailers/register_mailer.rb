class RegisterMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail( to: @user.email, subject: "#{Rails.application.config.site[:name]}: Validation de votre compte"  )
  end
end

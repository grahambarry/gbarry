class UseMailer < ApplicationMailer

  def account_activation(use)
    @use = use
    mail to: use.email, subject: "Account activation"
  end

  def password_reset(use)
    @use = use
    mail to: use.email, subject: "Password reset"
  end
end

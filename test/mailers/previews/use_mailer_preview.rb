# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UseMailerPreview < ActionMailer::Preview

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    UseMailer.account_activation
  use = Use.first
    use.activation_token = Use.new_token
    UseMailer.account_activation(use)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    use = Use.first
    use.reset_token = Use.new_token
    UseMailer.password_reset(use)
  end
end
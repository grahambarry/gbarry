require 'test_helper'

class UseMailerTest < ActionMailer::TestCase

  test "account_activation" do
    use = uses(:michael)
    use.activation_token = Use.new_token
    mail = UseMailer.account_activation(use)
    assert_equal "Account activation", mail.subject
    assert_equal [use.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match use.name,               mail.body.encoded
    assert_match use.activation_token,   mail.body.encoded
    assert_match CGI::escape(use.email), mail.body.encoded
  end

  test "password_reset" do
    use = uses(:michael)
    use.reset_token = Use.new_token
    mail = UseMailer.password_reset(use)
    assert_equal "Password reset", mail.subject
    assert_equal [use.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match use.reset_token,        mail.body.encoded
    assert_match CGI::escape(use.email), mail.body.encoded
  end
end
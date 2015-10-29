require 'test_helper'

class UsesSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'use.count' do
      post uses_path, use: { name:  "",
                               email: "use@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'uses/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'use.count', 1 do
      post uses_path, use: { name:  "Example use",
                               email: "use@example.com",
                               password:              "password",
                               password_confirmation: "password" }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    use = assigns(:use)
    assert_not use.activated?
    # Try to log in before activation.
    log_in_as(use)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(use.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(use.activation_token, email: use.email)
    assert use.reload.activated?
    follow_redirect!
    assert_template 'uses/show'
    assert is_logged_in?
  end
end
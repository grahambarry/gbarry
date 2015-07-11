require 'test_helper'

class UsesLoginTest < ActionDispatch::IntegrationTest

  def setup
    @use = uses(:michael)
  end

  test "login with remembering" do
    log_in_as(@use, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@use, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
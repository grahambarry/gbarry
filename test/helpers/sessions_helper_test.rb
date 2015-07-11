require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @use = uses(:michael)
    remember(@use)
  end

  test "current_use returns right use when session is nil" do
    assert_equal @use, current_use
    assert is_logged_in?
  end

  test "current_use returns nil when remember digest is wrong" do
    @use.update_attribute(:remember_digest, Use.digest(Use.new_token))
    assert_nil current_use
  end
end
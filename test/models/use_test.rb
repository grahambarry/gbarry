require 'test_helper'

class UseTest < ActiveSupport::TestCase
  def setup
    @use = Use.new(name: "Example Use", email: "use@example.com")
  end

  test "should be valid" do
    assert @use.valid?
  end
   test "name should be present" do
    @use.name = "     "
    assert_not @use.valid?
  end
  test "email should be present" do
    @use.email = "     "
    assert_not @use.valid?
  end
end
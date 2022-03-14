require "test_helper"

class FriendTest < ActiveSupport::TestCase
  test "should not save friend without name" do
    friend = Friend.new
    assert_not friend.save, "Saved friend without a name"
  end
end

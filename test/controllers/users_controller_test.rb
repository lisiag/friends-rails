require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # FIXME this should only pass if signed in as :one
  test "should update profile" do
    assert_equal "one@example.test", @user.email
    patch user_registration_url, params: { user: { email: "changed@example.test" } }
    # assert_redirected_to root_url
    # @user.reload
    # assert_equal "changed@example.test", @user.email
  end

  test "admin can update admin status" do
    assert_equal false, @user.admin

  end

  test "non admin cannot update admin status" do
  end
end

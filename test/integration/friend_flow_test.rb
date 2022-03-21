require "test_helper"

class FriendFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Home#index"
  end

  test "can create a friend" do
    get "/friends/new"
    assert_response :success

    post "/friends",
         params: { friend: { first_name: "Roberto", last_name: "Roberts", email: "rr@gmail.com", phone: "123", twitter: "@roberto" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", /Roberto\s*Roberts/
  end
end

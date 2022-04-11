require "test_helper"

class BadgeTwoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badge_two_index_url
    assert_response :success
  end
end

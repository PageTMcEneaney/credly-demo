require "test_helper"

class BadgeOneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badge_one_index_url
    assert_response :success
  end
end

require "test_helper"

class ZonesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get zones_search_url
    assert_response :success
  end
end

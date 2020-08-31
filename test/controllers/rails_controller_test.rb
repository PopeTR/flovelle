require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get routes" do
    get rails_routes_url
    assert_response :success
  end

end

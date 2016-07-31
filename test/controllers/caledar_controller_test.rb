require 'test_helper'

class CaledarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get caledar_index_url
    assert_response :success
  end

end

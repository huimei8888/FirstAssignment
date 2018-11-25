require 'test_helper'

class OrderingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ordering_index_url
    assert_response :success
  end

end

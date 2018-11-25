require 'test_helper'

class UserLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_login_create_url
    assert_response :success
  end

  test "should get new" do
    get user_login_new_url
    assert_response :success
  end

end

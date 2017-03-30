require 'test_helper'

class UnregisterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get unregister_new_url
    assert_response :success
  end

  test "should get index" do
    get unregister_index_url
    assert_response :success
  end

  test "should get show" do
    get unregister_show_url
    assert_response :success
  end

end

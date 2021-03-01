require 'test_helper'

class LawyersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lawyers_index_url
    assert_response :success
  end

  test "should get show" do
    get lawyers_show_url
    assert_response :success
  end

end

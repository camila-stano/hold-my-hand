require 'test_helper'

class SheltersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shelters_index_url
    assert_response :success
  end

  test "should get show" do
    get shelters_show_url
    assert_response :success
  end

end

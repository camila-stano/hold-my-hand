require 'test_helper'

class EducationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get education_index_url
    assert_response :success
  end

  test "should get show" do
    get education_show_url
    assert_response :success
  end

end

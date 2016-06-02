require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get readme_cn" do
    get :readme_cn
    assert_response :success
  end

  test "should get readme_jp" do
    get :readme_jp
    assert_response :success
  end

end

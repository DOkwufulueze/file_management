require 'test_helper'

class ManagedFilesUsagesControllerTest < ActionController::TestCase
  test "should get models" do
    get :models
    assert_response :success
  end

  test "should get usage" do
    get :usage
    assert_response :success
  end

end

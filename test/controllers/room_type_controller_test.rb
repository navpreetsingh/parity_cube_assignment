require 'test_helper'

class RoomTypeControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get book" do
    get :book
    assert_response :success
  end

end

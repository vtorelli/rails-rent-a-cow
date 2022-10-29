require "test_helper"

class CowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cows_new_url
    assert_response :success
  end

  test "should get create" do
    get cows_create_url
    assert_response :success
  end
end

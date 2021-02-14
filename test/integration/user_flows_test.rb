require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "can create a recipe" do
    login_as users(:one)
    user = users(:one)

    get "/recipes/new"
    assert_response :success

    post "/recipes",
      params: { recipe: { name: "new recipe", user: user, photo: fixture_file_upload('files/yum.jpg') } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    # assert_select "p", " new recipe"
  end
end

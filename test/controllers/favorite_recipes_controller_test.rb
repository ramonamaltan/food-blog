require 'test_helper'

class FavoriteRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    @user = users(:one)
  end

  test "should get index" do
    login_as @user
    get recipe_favorite_recipes_path(@recipe)
    assert_response :success
  end
end

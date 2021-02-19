require 'test_helper'

class FavoriteRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    @user = users(:one)
  end

  test "should create favorite recipe" do
    login_as @user

    assert_difference('FavoriteRecipe.count') do
      post recipe_favorite_recipes_path(@recipe), params: { favorite_recipe: {recipe: @recipe, user: @user} }
    end
    assert_redirected_to recipe_path(@recipe)
  end
end

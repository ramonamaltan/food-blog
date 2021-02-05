require 'test_helper'

class RecipeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get new" do
    login_as users(:one)
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe" do
    user = users(:one)
    login_as users(:one)

    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: 'Paella', user: user } }
    end
  end
end

require 'test_helper'

class RecipeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    @user = users(:one)
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
    login_as @user
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe" do
    login_as @user

    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: 'Paella', user: @user, photo: fixture_file_upload('files/yum.jpg') } }
    end
    
    assert_redirected_to new_recipe_dose_url(Recipe.last)
  end

  test "should get edit" do
    login_as @user
    get edit_recipe_url(@recipe)

    assert_response :success
  end

  test "should update recipe" do
    login_as @user
    patch recipe_url(@recipe), params: { recipe: { name: 'Another Spanish Dish', user: @user, photo: fixture_file_upload('files/yum.jpg') } }

    assert_redirected_to new_recipe_dose_url(@recipe)
  end

  test "should destroy recipe" do
    login_as @user

    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe)
    end
    assert_redirected_to recipes_path
  end
end

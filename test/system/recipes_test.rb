require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit recipes_url
  
    assert_selector "h1", text: "Alle Rezepte"
  end

  # test "number of recipes on index" do
  #   recipes on page should be all recipes from db
  # end

  test "creating a recipe" do
    login_as users(:one)
    visit new_recipe_path

    fill_in 'recipe_name', with: 'Creating a Recipe'
    fill_in 'recipe_description', with: 'Created this recipe successfully'

    click_on 'Create Recipe'

    assert_current_path('/recipes')
  end
end

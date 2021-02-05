require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit recipes_url
  
    assert_selector "h1", text: "Alle Rezepte"
  end

  # test "number of recipes on index" do
  #   recipes on page should be all recipes from db
  # end
end

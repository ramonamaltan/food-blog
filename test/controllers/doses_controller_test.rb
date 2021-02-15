require 'test_helper'

class DosesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
    @ingredient = ingredients(:one)
  end

  test "should get new" do
    login_as users(:one)

    get new_recipe_dose_url(@recipe)

    assert_response :success
  end

  # test "should create dose" do
  #   login_as users(:one)

  #   assert_difference("Dose.count") do
  #     post recipe_doses_url(@recipe), params: { dose: { unit: 'grams', amount: 200, recipe_id: @recipe.id, ingredient_attributes: { id: @ingredient.id, name: @ingredient.name } } }
  #   end
  # end
end

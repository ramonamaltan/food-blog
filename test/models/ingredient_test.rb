require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  test 'ingredient must have name to be valid' do
    ingredient = Ingredient.new
    assert_not ingredient.valid?
  end

  # test 'destroy ingredient should destroy all doses of the ingredient' do
  #   assert_difference('Dose.count', -1) do
  #     ingredients(:one).destroy
  #   end
  # end
end

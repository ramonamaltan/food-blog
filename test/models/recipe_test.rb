require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'recipe without name should be invalid' do
    recipe = Recipe.new(user: @user)
    assert_not recipe.valid?
  end

  test 'recipe with taken name should be invalid' do
    other_recipe = recipes(:one)
    recipe = Recipe.new(name: other_recipe.name, user: @user)

    assert_not recipe.valid?
  end
end

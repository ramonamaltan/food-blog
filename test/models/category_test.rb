require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @recipe = recipes(:one)
  end
  
  test "valid category must have name and recipe" do
    category = Category.new(name: 'vegan', recipe: @recipe)
    assert category.valid?
  end

  test 'category must have a name to be valid' do
    category = Category.new(recipe: @recipe)
    assert_not category.valid?
  end
end

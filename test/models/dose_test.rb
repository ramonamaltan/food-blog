require 'test_helper'

class DoseTest < ActiveSupport::TestCase
  setup do
    @ingredient = ingredients(:one)
    @recipe = recipes(:one)
  end

  test "dose must have unit to be valid" do
    dose = Dose.new(amount: 250, recipe: @recipe, ingredient: @ingredient)
    assert_not dose.valid?
  end

  test 'dose must have amount to be valid' do
    dose = Dose.new(unit: 'grams', recipe: @recipe, ingredient: @ingredient)
    assert_not dose.valid?
  end

  test 'dose is valid if unit is any of the given values' do
    dose = Dose.new(unit: 'liters', amount: 250, recipe: @recipe, ingredient: @ingredient)
    assert dose.valid?
  end

  test 'dose is not valid if unit is not any of the given values' do
    dose = Dose.new(unit: 'pints', amount: 250, recipe: @recipe, ingredient: @ingredient)
    assert_not dose.valid?
  end
end

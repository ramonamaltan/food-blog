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

  test "should create dose" do
    user = users(:one)
    @recipe2 = Recipe.create(name: 'bananabread', user: user, photo: fixture_file_upload('files/yum.jpg'))
    login_as user

    assert_difference("Dose.count", 1) do
      assert_difference("Ingredient.count", 1) do
        post recipe_doses_url(@recipe), params: { dose: {
          unit: 'grams', amount: '200', recipe: recipe,
          ingredient: Ingredient.create(name: 'potato')
        } }
      end
    end

    assert_redirected_to new_recipe_dose_path(@recipe)
  end

  test 'should destroy dose' do
    @dose = doses(:one)

    assert_difference "Dose.count", -1 do
      @dose.destroy
    end
  end
end

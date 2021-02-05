require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, encrypted_password: 'test123456')
    assert_not user.valid?
  end

  test 'destroy user should destroy all recipes of this user' do
    assert_difference('Recipe.count', -1) do
      users(:one).destroy
    end
  end
end

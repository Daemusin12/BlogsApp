require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    user = User.new(
      name: 'Leo',
      email: 'test2@gmail.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    assert user.valid?
  end

  test "should not be valid without an email" do
    user = User.new(name: 'Leo', password: 'password123', password_confirmation: 'password123')
    assert_not user.valid?
  end

  test "should not be valid without a password" do
    user = User.new(name: 'Leo', email: 'test@gmail.com')
    assert_not user.valid?
  end

  test "should not be valid without a name" do
    user = User.new(password: 'password123', password_confirmation: 'password123')
    assert_not user.valid?
  end
end
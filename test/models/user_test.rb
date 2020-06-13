require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(email: "juancho@gmail.com", password: 'test')
    @user.save
  end

  test 'user with a valid email should be valid' do
    user = User.new(email: 'test@test.org', password: 'test')
    assert user.valid?   
  end

  test 'user with invalid email should be invalid' do
    user = User.new(email: 'test', password: 'test')
    assert_not user.valid?
  end
end

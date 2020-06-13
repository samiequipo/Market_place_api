require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(email: "juancho@gmail.com", password_digest: 'test')
    @user.save
  end

  test 'user should have a valid email' do
    user = User.new(email: 'test@test.org', password_digest: 'test')
    assert user.valid?   
  end

  test 'user with invalid email should be invalid' do
    user = User.new(email: 'test', password_digest: 'test')
    assert_not user.valid?
  end

  test 'user with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest:
    'test')
    assert_not user.valid?
  end
end

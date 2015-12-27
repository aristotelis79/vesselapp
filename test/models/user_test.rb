require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name:"Example User", email:"user@mail.org", password: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "email validation with valid addresses" do
    valid_addresses = %w[user@example.org USER@foo.BAR U_SE-R@foo.bar.org 
                                      user.last@foo.com user+last@foo.bar]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
 
  test "email validation with invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                              foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end
 
  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password should have a minimum length" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end
end

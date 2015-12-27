require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:Admin_IT)
    @user = users(:aristotelis)
    @vessel_params  = { title: "new title",
                        description: "new description",
                        daily_price: 300,
                        fee_pc: 23  }
  end

  test "login with invalid information" do
    get admin_path
    assert_template 'admin'
    post admin_path, session: {email: "", password: ""}
    assert_not flash.empty?
    get admin_path
    assert flash.empty?
  end
  
  test "login with valid information but not admin privileges" do
    get admin_path
    post admin_path, session: { email: @user.email, password: "foobar" }
    get admin_path
    assert flash.empty?
  end

  test "login with valid information and admin privileges" do
    get admin_path
    assert_template 'admin'
    post admin_path, session: { email: @admin.email, password: "foobar" }
    assert_redirected_to admin_vessels_path
    follow_redirect!
    get admin_vessels_path
    assert_select "a[href=?]", new_admin_vessel_path
    assert_difference 'Vessel.count', 1 do
      post admin_vessels_url vessel: @vessel_params
    end
  end
  
end

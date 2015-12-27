require 'test_helper'

class NewVesselTest < ActionDispatch::IntegrationTest

  test "should create new vessel without login" do
  get vessels_path
  assert_template 'index'
  assert_select "a[href=?]", new_vessel_path
  assert_difference 'Vessel.count', 1 do
    post vessels_url vessel: {  title: "new title",
                                description: "new description",
                                daily_price: 300 }
    end
  end
end
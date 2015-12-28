require 'test_helper'

class VesselsControllerTest < ActionController::TestCase
  
  def setup
    @admin = users(:Admin_IT)
    @user = users(:aristotelis)
    @vessel_params  = { title: "new title",
                        description: "new description",
                        daily_price: 300 }
    @vessel = vessels(:one)
    ActionMailer::Base.deliveries.clear
  end

  test "should send email to admin if new a vessel created by non login user" do
    session[:user_id] = @user.id
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post :create, vessel: @vessel_params
    end
  end

  test "should send email to admin if edit a vessel by non login user" do
    session[:user_id] = @user.id
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      put :update, :id => @vessel,:vessel => @vessel_params
    end
  end

  test "should send email to admin if new a vessel created by non admin" do
    session[:user_id] = @user.id
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post :create, vessel: @vessel_params
    end
  end

  test "should send email to admin if edit a vessel by non admin" do
    session[:user_id] = @user.id
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      put :update, :id => @vessel,:vessel => @vessel_params
    end
  end

  test "should not send email if new a vessel created by admin" do
    session[:user_id] = @admin.id
    assert_no_difference 'ActionMailer::Base.deliveries.size' do
      post :create, vessel: @vessel_params
    end
  end
  
  test "should not send email if edit a vessel by admin" do
    session[:user_id] = @admin.id
    assert_no_difference 'ActionMailer::Base.deliveries.size' do
      put :update, :id => @vessel,:vessel => @vessel_params
    end
  end
end
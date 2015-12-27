module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def is_not_admin?
    current_user.nil? or !current_user.admin?
  end
end

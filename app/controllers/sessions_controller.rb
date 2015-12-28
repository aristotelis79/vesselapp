class SessionsController < ApplicationController
  layout 'admin'
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id  # Logs in the given user.
      redirect_to admin_vessels_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def sessions_params
    params.require(:session).permit(:email, :password)
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end

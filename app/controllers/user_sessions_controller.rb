class UserSessionsController < ApplicationController
  def new
  end



  def create
	user = User.find_by(email: params[:login][:email])
	if user && user.authenticate(params[:login][:password])
	session[:user_id] = user.id.to_s
	flash[:success] = "Welcome to the Stoned Age!" 
	redirect_to root_path
	else
	flash[:error] = "There was a problem logging in. Please check your email and password." 
	render action: 'new' #change?
	end
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to login_path
  end 

end

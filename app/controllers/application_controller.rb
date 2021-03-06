# require "application_responder"

class ApplicationController < ActionController::Base
  # self.responder = ApplicationResponder
  # respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 


  helper_method :current_user 

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def require_user 
  	redirect_to '/login' unless 
  		current_user
  	end
  end
  		# if current_user
  		# 	true
  		# else
  		# 	redirect_to new_user_session_path, notice: "You must log in"
  		# end
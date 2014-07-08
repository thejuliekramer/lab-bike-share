class SessionsController < ApplicationController

	skip_before_action :redirect_to_login

	def login
		redirect_to root_path if @current_user
	end

	def login_attempt
		user = User.find_by(username: params[:username]).try(:authenticate, params[:login_password])
		if user
			session[:user_id] = user.id
			redirect_to root_path, flash: { success: "Welcome back.  You are now logged in as #{user.username}" }
		else
			flash[:notice] = "Invalid Username or Password"
			render :login
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end

	def create
		auth = request.env["omniauth.auth"]
		user = User.find_by(provider: auth["provider"], uid: auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id
		redirect_to root_path
	end
end

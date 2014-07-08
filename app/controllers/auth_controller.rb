class AuthController < ApplicationController

	skip_before_action :redirect_to_login

	def cobot
		redirect_to "https://www.cobot.me/oauth/authorize?response_type=code&client_id=c5787a5c285ad5fc4d0ae7b6d68419f1&redirect_uri=http://localhost:3000/auth/cobot/callback&scope=read_user"
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
end

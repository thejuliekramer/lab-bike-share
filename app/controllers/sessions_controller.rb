class SessionsController < ApplicationController

	skip_before_action :redirect_to_login

	def cobot
		redirect_to "https://www.cobot.me/oauth/authorize?response_type=code&client_id=c5787a5c285ad5fc4d0ae7b6d68419f1&redirect_uri=http://localhost:3000/auth/cobot/callback&scope=read_user"
	end

	def login
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

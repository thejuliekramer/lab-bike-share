class ApplicationController < ActionController::Base
	before_action :current_user, :redirect_to_login
	helper_method :current_user 

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) rescue nil
	end

	def redirect_to_login
		redirect_to '/login' if current_user.nil?
	end

	protect_from_forgery with: :exception
end

## any method you don't want called over the internet make private
## public methods are publicly accessable actions
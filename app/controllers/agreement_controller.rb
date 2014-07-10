class AgreementController < ApplicationController
	def index
		@checkout = @current_user.has_bike? ? @current_user.current_checkout : Checkout.new
	end
end

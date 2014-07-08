class User < ActiveRecord::Base
	has_many :checkouts, dependent: :destroy

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.email = auth["info"]["email"]
			user.picture = auth["info"]["picture"]
			# Admin access not working :/
			# user.admin = true if auth["extra"]["raw_info"]["admin_of"]["name"] == "The LAB Miami" rescue false
		end
	end
end
class Checkout < ActiveRecord::Base
	belongs_to :user
	belongs_to :bike

	validates :user, uniqueness: { scope: [:returned_at], message: "currently has a bike checked out." }
	validates :bike, uniqueness: { scope: [:returned_at], message: "has already been checked out." }
end

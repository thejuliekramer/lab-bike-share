class Bike < ActiveRecord::Base
	has_many :checkouts, dependent: :destroy
	has_many :accessories, dependent: :destroy

	validates :name, presence: true,
	                 length: { minimum: 2 }


end

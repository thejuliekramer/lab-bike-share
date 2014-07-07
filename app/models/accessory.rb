class Accessory < ActiveRecord::Base
	belongs_to :bike

	validates :type, presence: true,
	                 length: { minimum: 2 }

	validates :not_missing, inclusion: [true, false]
end

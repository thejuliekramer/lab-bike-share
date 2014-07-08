class Bike < ActiveRecord::Base
	has_many :checkouts, dependent: :destroy
	has_many :accessories, dependent: :destroy

	validates :name, presence: true,
	                 length: { minimum: 2 }


	has_attached_file :image, styles: { medium: "350x350#", thumb: "100x100#" } #, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /^image\/(png|gif|jpeg)/

	def is_checked_out?
		self.checkouts.where(returned_at: nil).any?
	end

end

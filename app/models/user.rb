class User < ActiveRecord::Base
	has_many :checkouts, dependent: :destroy

	has_secure_password

	validates :username, presence: true,
	                     uniqueness: { case_sensitive: false },
	                     length: { minimum: 2 }

	validates :admin,    inclusion: [true, false]

	has_attached_file :avatar, :styles => { :medium => "350x350#", :thumb => "100x100#" }#, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

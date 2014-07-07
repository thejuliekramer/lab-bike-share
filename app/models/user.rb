class User < ActiveRecord::Base
	has_many :checkouts, dependent: :destroy

	validates :username, presence: true,
	                     uniqueness: { case_sensitive: false },
	                     length: { minimum: 2 }

	validates :admin, inclusion: [true, false]
end

class Checkout < ActiveRecord::Base
  belongs_to :user
  belongs_to :bike

  validates :returned_at, uniqueness: true
end

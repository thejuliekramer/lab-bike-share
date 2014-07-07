class AddBikeIdToAccessories < ActiveRecord::Migration
  def change
    add_reference :accessories, :bike, index: true
  end
end

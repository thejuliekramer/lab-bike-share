class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.references :user, index: true
      t.references :bike, index: true
      t.datetime :returned_at

      t.timestamps
    end
  end
end

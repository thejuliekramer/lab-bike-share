class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :type
      t.boolean :not_missing

      t.timestamps
    end
  end
end

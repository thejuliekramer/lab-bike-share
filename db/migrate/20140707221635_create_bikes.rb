class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :lock_password
      t.string :name

      t.timestamps
    end
  end
end

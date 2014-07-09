class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :email
      t.string :picture
      t.boolean :admin

      t.timestamps
    end
  end
end

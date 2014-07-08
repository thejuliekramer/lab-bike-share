class AddAttachmentImageToAccessories < ActiveRecord::Migration
  def self.up
    change_table :accessories do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :accessories, :image
  end
end

class AddAvatar4ToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :avatar4
    end
  end

  def self.down
    drop_attached_file :products, :avatar4
  end
end

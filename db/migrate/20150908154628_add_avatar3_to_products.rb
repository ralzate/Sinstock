class AddAvatar3ToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :avatar3
    end
  end

  def self.down
    drop_attached_file :products, :avatar3
  end
end

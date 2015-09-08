class AddAvatar2ToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :avatar2
    end
  end

  def self.down
    drop_attached_file :products, :avatar2
  end
end

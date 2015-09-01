class CreateManageUsers < ActiveRecord::Migration
  def change
    create_table :manage_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :rol, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

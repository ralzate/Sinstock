class CreateTypeUsers < ActiveRecord::Migration
  def change
    create_table :type_users do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end

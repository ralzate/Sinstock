class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :stock
      t.string :reference
      t.references :type_product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.decimal :unit_price
      t.integer :state_product
      t.decimal :total
      t.integer :new_used

      t.timestamps null: false
    end
  end
end

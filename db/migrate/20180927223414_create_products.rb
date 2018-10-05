class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 9, scale: 2
      t.text :description
      t.boolean :stock, default: true
      t.integer :supplier_id

      t.timestamps
    end
  end
end
